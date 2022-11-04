# frozen_string_literal: true
class FichaProcedimentoGerenciarThrift
  require 'thrift'

  require_relative './ficha_atendimento_procedimento_types'
  require_relative '../common_types'

  def initialize(procedure_sheet)
    @procedure_sheet = procedure_sheet
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

        obj_instance.send("#{each_method}=", @procedure_sheet[method_sym]) unless @procedure_sheet[method_sym].nil?
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

    ficha_procedimento_child_class = Br::Gov::Saude::Esusab::Ras::Atendprocedimentos::FichaProcedimentoChildThrift
    ficha_procedimento_master_class = Br::Gov::Saude::Esusab::Ras::Atendprocedimentos::FichaProcedimentoMasterThrift

    ficha_procedimento_child_methods = get_methods(ficha_procedimento_child_class)
    ficha_procedimento_master_methods = get_methods(ficha_procedimento_master_class)

    ficha_procedimento_master_instance = ficha_procedimento_master_class.new

    ficha_procedimento_child_array_formatted = @procedure_sheet.care_procedures.map do |each_care_procedure|
      each_care_procedure.dtNascimento = each_care_procedure.dtNascimento.nil? ? nil : each_care_procedure.dtNascimento.to_time.to_i
      each_care_procedure
    end

    fill_instance_methods.call(ficha_procedimento_master_methods, ficha_procedimento_master_instance)
    ficha_procedimento_child_array = fill_instance_methods_with_array.call(ficha_procedimento_child_array_formatted, ficha_procedimento_child_methods, ficha_procedimento_child_class)

    ficha_procedimento_master_instance.atendProcedimentos = ficha_procedimento_child_array

    serializer = Thrift::Serializer.new

    ficha_procedimento_serializado = serializer.serialize(ficha_procedimento_master_instance)

    ficha_procedimento_serializado
  end
end
