# frozen_string_literal: true
class CadastroDomiciliarGerenciarThrift
  require 'thrift'

  require_relative './cadastro_domiciliar_types'
  require_relative '../common_types'

  def initialize(household_registration)
    @household_registration = household_registration
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

        obj_instance.send("#{each_method}=", @household_registration[method_sym]) unless @household_registration[method_sym].nil?
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

    condicao_moradia_class = Br::Gov::Saude::Esusab::Ras::Cadastrodomiciliar::CondicaoMoradiaThrift
    familia_row_class = Br::Gov::Saude::Esusab::Ras::Cadastrodomiciliar::FamiliaRowThrift
    cadastro_domiciliar_class = Br::Gov::Saude::Esusab::Ras::Cadastrodomiciliar::CadastroDomiciliarThrift

    condicao_moradia_methods = get_methods(condicao_moradia_class)
    familia_row_methods = get_methods(familia_row_class)
    cadastro_domiciliar_methods = get_methods(cadastro_domiciliar_class)

    condicao_moradia_instance = condicao_moradia_class.new
    cadastro_domiciliar_instance = cadastro_domiciliar_class.new

    fill_instance_methods.call(condicao_moradia_methods, condicao_moradia_instance)
    fill_instance_methods.call(cadastro_domiciliar_methods, cadastro_domiciliar_instance)

    familias_array_formatted = @household_registration.families.map do |each_family|
      each_family.dataNascimentoResponsavel = each_family.dataNascimentoResponsavel.nil? ? nil : each_family.dataNascimentoResponsavel.to_time.to_i
      each_family.resideDesde = each_family.resideDesde.nil? ? nil : each_family.resideDesde.to_time.to_i
      each_family
    end

    familias_array = fill_instance_methods_with_array.call(familias_array_formatted, familia_row_methods, familia_row_class)

    cadastro_domiciliar_instance.familias = familias_array
    cadastro_domiciliar_instance.condicaoMoradia = condicao_moradia_instance

    serializer = Thrift::Serializer.new

    cadastro_domiciliar_serializado = serializer.serialize(cadastro_domiciliar_instance)

    cadastro_domiciliar_serializado
  end

end
