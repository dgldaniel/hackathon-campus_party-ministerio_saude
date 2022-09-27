# frozen_string_literal: true
class SerializeEsusJob < ApplicationJob
  require 'thrift'
  require 'date'

  require 'esus/models/cadastro_individual_types'
  require 'esus/models/dado_transporte_types'
  require 'esus/models/common_types'

  queue_as :default

  def perform(record_data)
    cadastro_individual_class = Br::Gov::Saude::Esusab::Ras::Cadastroindividual::CadastroIndividualThrift
    condicoes_saude_class = Br::Gov::Saude::Esusab::Ras::Cadastroindividual::CondicoesDeSaudeThrift
    em_situacao_rua_class = Br::Gov::Saude::Esusab::Ras::Cadastroindividual::EmSituacaoDeRuaThrift
    identificacao_usuario_class = Br::Gov::Saude::Esusab::Ras::Cadastroindividual::IdentificacaoUsuarioCidadaoThrift
    informacoes_socio_demografica_class = Br::Gov::Saude::Esusab::Ras::Cadastroindividual::InformacoesSocioDemograficasThrift
    saida_cidadao_class = Br::Gov::Saude::Esusab::Ras::Cadastroindividual::SaidaCidadaoCadastroThrift

    cadastro_individual_methods = cadastro_individual_class.instance_methods(false).map do |each_methods|
      each_methods.to_s.gsub(/[^a-zA-Z0-9\-]/, "")
    end

    condicoes_saude_methods= condicoes_saude_class.instance_methods(false).map do |each_methods|
      each_methods.to_s.gsub(/[^a-zA-Z0-9\-]/, "")
    end

    em_situacao_rua_methods =em_situacao_rua_class.instance_methods(false).map do |each_methods|
      each_methods.to_s.gsub(/[^a-zA-Z0-9\-]/, "")
    end

    identificacao_usuario_methods = identificacao_usuario_class.instance_methods(false).map do |each_methods|
      each_methods.to_s.gsub(/[^a-zA-Z0-9\-]/, "")
    end

    informacoes_socio_demografica_methods = informacoes_socio_demografica_class.instance_methods(false).map do |each_methods|
      each_methods.to_s.gsub(/[^a-zA-Z0-9\-]/, "")
    end

    saida_cidadao_methods = saida_cidadao_class.instance_methods(false).map do |each_methods|
      each_methods.to_s.gsub(/[^a-zA-Z0-9\-]/, "")
    end

    cadastro_individual_instance = cadastro_individual_class.new

    cadastro_individual_methods.uniq.each do |each_method|
      cadastro_individual_instance.send("#{each_method}=", record_data[each_method.to_sym]) unless record_data[each_method.to_sym].nil?
    end

    condicoes_saude_instance = condicoes_saude_class.new

    condicoes_saude_methods.uniq.each do |each_method|

      condicoes_saude_instance.send("#{each_method}=", record_data[each_method.to_sym]) unless record_data[each_method.to_sym].nil?
    end

    em_situacao_rua_instance = em_situacao_rua_class.new

    em_situacao_rua_methods.uniq.each do |each_method|
      em_situacao_rua_instance.send("#{each_method}=", record_data[each_method.to_sym]) unless record_data[each_method.to_sym].nil?
    end

    identificacao_usuario_instance = identificacao_usuario_class.new

    identificacao_usuario_methods.uniq.each do |each_method|
      identificacao_usuario_instance.send("#{each_method}=", record_data[each_method.to_sym]) unless record_data[each_method.to_sym].nil?
    end

    informacoes_socio_demografica_instance = informacoes_socio_demografica_class.new

    informacoes_socio_demografica_methods.uniq.each do |each_method|
      informacoes_socio_demografica_instance.send("#{each_method}=", record_data[each_method.to_sym]) unless record_data[each_method.to_sym].nil?
    end

    saida_cidadao_instance = saida_cidadao_class.new

    saida_cidadao_methods.uniq.each do |each_method|
      saida_cidadao_instance.send("#{each_method}=", record_data[each_method.to_sym]) unless record_data[each_method.to_sym].nil?
    end

    cadastro_individual_instance = cadastro_individual_class.new

    cadastro_individual_methods.uniq.each do |each_method|
      cadastro_individual_instance.send("#{each_method}=", record_data[each_method.to_sym]) unless record_data[each_method.to_sym].nil?
    end

    header_thrift = Br::Gov::Saude::Esusab::Ras::Common::UnicaLotacaoHeaderThrift.new

    header_thrift.profissionalCNS = '898001160660761'
    header_thrift.cboCodigo_2002 = '223212'
    header_thrift.cnes = '7381123'
    header_thrift.ine = '0000406465'
    header_thrift.dataAtendimento = Time.now.to_i
    header_thrift.codigoIbgeMunicipio = '4205407'

    cadastro_individual_instance.condicoesDeSaude = condicoes_saude_instance
    cadastro_individual_instance.emSituacaoDeRua = em_situacao_rua_instance
    cadastro_individual_instance.identificacaoUsuarioCidadao = identificacao_usuario_instance
    cadastro_individual_instance.informacoesSocioDemograficas = informacoes_socio_demografica_instance
    cadastro_individual_instance.saidaCidadaoCadastro = saida_cidadao_instance
    cadastro_individual_instance.headerTransport = header_thrift

    originadora = Br::Gov::Saude::Esusab::Dadotransp::DadoInstalacaoThrift.new
    remetente = Br::Gov::Saude::Esusab::Dadotransp::DadoInstalacaoThrift.new
    dado_transporte_instance = Br::Gov::Saude::Esusab::Dadotransp::DadoTransporteThrift.new
    versao_thrift = Br::Gov::Saude::Esusab::Dadotransp::VersaoThrift.new

    originadora.contraChave = '123456'
    originadora.uuidInstalacao = 'UUIDUNICO111'
    originadora.cpfOuCnpj = '11111111111'
    originadora.nomeOuRazaoSocial = 'Nome ou Razao Social Originadora'
    originadora.fone = '999999999'
    originadora.email = 'a@b.com'

    dado_transporte_instance.originadora = originadora

    remetente.contraChave = '789010'
    remetente.uuidInstalacao = 'UUIDUNICO222'
    remetente.cpfOuCnpj = '11111111111'
    remetente.nomeOuRazaoSocial = 'Nome ou Razao Social Remetente'
    remetente.fone = '98888888'
    remetente.email = 'b@a.com'

    dado_transporte_instance.remetente = originadora

    dado_transporte_instance.numLote = 1

    dado_transporte_instance.tipoDadoSerializado = 2

    versao_thrift.major = 3
    versao_thrift.minor = 2
    versao_thrift.revision = 3

    dado_transporte_instance.versao = versao_thrift

    serializer = Thrift::Serializer.new

    p(cadastro_individual_instance)

    cadastro_individual_serializado = serializer.serialize(cadastro_individual_instance)

    dado_transporte_instance.dadoSerializado = cadastro_individual_serializado

    dado_transporte_serializador = Thrift::Serializer.new
    dado_transporte_serializado = dado_transporte_serializador.serialize(dado_transporte_instance)

    record_data.thrift_file.attach(io: dado_transporte_serializado, filename: "#{dado_transporte_thrift.uuidDadoSerializado}.esus")

    record_data.save!
  end
end
