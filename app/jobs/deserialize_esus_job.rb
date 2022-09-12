# frozen_string_literal: true
class DeserializeEsusJob < ApplicationJob
  require 'zip'
  require 'thrift'
  require 'date'

  require 'esus/models/cadastro_individual_types'
  require 'esus/models/dado_transporte_types'

  queue_as :default

  def perform(thrift_data_zip, class_name)
    dado_transporte_instancia = Br::Gov::Saude::Esusab::Dadotransp::DadoTransporteThrift.new

    deserializer = Thrift::Deserializer.new

    class_thrift = {
      'Cadastro Individual' => Br::Gov::Saude::Esusab::Ras::Cadastroindividual::CadastroIndividualThrift.new,
    }

    data_to_db = []

    Zip::File.open(thrift_data_zip.tempfile) do |zip_file|
      zip_file.each do |entry|
        thrift_data = entry.get_input_stream.read

        class_instanced = class_thrift[class_name]

        dado_transporte_deserializado = deserializer.deserialize(dado_transporte_instancia, thrift_data)

        dado_serializado = dado_transporte_deserializado.dadoSerializado

        dado_deserializado = deserializer.deserialize(class_instanced, dado_serializado)

        hash_data = {}

        hash_data[:statusTermoRecusaCadastroIndividualAtencaoBasica] = dado_deserializado.statusTermoRecusaCadastroIndividualAtencaoBasica
        hash_data[:tpCdsOrigem] = dado_deserializado.tpCdsOrigem
        hash_data[:uuid] = dado_deserializado.uuid
        hash_data[:uuidFichaOriginadora] = dado_deserializado.uuidFichaOriginadora
        # hash_data[:uuidCidadao] = dado_deserializado.uuidCidadao

        dado_deserializado.condicoesDeSaude.instance_values.each do |key, value|
          if key == 'statusUsaPlantaMedicinais'
            hash_data['statusUsaPlantasMedicinais'] = value
          else
            hash_data[key] = value
          end
        end

        dado_deserializado.emSituacaoDeRua.instance_values.each do |key, value|
          hash_data[key] = key == 'quantidadeAlimentacoesAoDiaSituacaoRua' ? nil : value
        end

        dado_deserializado.identificacaoUsuarioCidadao.instance_values.each do |key, value|
          hash_data[key] = key.include?('dataAtendimento') || key.include?('dataNascimentoCidadao') ? Time.at(value / 1000) : value
        end

        dado_deserializado.informacoesSocioDemograficas.instance_values.each do |key, value|
          hash_data[key] = value
        end

        dado_deserializado.headerTransport.instance_values.each do |key, value|
          hash_data[key] = value
        end

        data_to_db << hash_data
      end
    end

    data_to_db.each do |each_data|
      has_name = IndividualRegistration.find_by(nomeCidadao: each_data['nomeCidadao'])

      if has_name.nil?
        IndividualRegistration.create(each_data)
      end

    end
  end
end
