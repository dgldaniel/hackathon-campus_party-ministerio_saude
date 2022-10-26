# frozen_string_literal: true
class FichaAtividadeColetivaGerenciarThrift
  require 'thrift'

  require_relative './ficha_atividade_coletiva_types'
  require_relative '../common_types'

  def initialize(collective_activity_sheets)
    @collective_activity_sheets = collective_activity_sheets
  end

  def get_methods(class_thirft)
    methods_of_class = class_thirft.instance_methods(false).map do |each_methods|
      each_methods.to_s.gsub(/[^a-zA-Z0-9\-]/, "")
    end

    methods_of_class.uniq
  end

  def serialize
    fill_instance_methods = -> (methods, obj_instance) do
      methods.each do |each_method|
        method_sym = each_method.to_sym

        obj_instance.send("#{each_method}=", @collective_activity_sheets[method_sym]) unless @collective_activity_sheets[method_sym].nil?
      end
    end

    fill_instance_methods_with_array = -> (array, methods, class_thirft) do
      new_array = []

      array.each do |record_data|
        instance_thirft = class_thirft.new

        methods.each do |each_method|
          method_sym = each_method.to_sym

          instance_thirft.send("#{each_method}=", record_data[method_sym]) unless record_data[method_sym].nil?
        end

        new_array.push(instance_thirft)
      end

      new_array
    end

    participante_class = Br::Gov::Saude::Esusab::Ras::Atividadecoletiva::ParticipanteRowItemThrift
    profissional_class = Br::Gov::Saude::Esusab::Ras::Atividadecoletiva::ProfissionalCboRowItemThrift
    ficha_coletiva_class = Br::Gov::Saude::Esusab::Ras::Atividadecoletiva::FichaAtividadeColetivaThrift

    participante_methods = get_methods(participante_class)
    profissional_methods = get_methods(profissional_class)
    ficha_coletiva_methods = get_methods(ficha_coletiva_class)

    ficha_coletiva_instance = ficha_coletiva_class.new

    fill_instance_methods.call(ficha_coletiva_methods, ficha_coletiva_instance)

    profissional_array = fill_instance_methods_with_array.call(@collective_activity_sheets.professionals, profissional_methods, profissional_class)
    participante_array = fill_instance_methods_with_array.call(@collective_activity_sheets.participants, participante_methods, participante_class)

    ficha_coletiva_instance.profissionais = profissional_array
    ficha_coletiva_instance.participantes = participante_array

    serializer = Thrift::Serializer.new

    ficha_coletiva_serializado = serializer.serialize(ficha_coletiva_instance)

    ficha_coletiva_serializado
  end

end
