# frozen_string_literal: true
class FichaAtendimentoIndividualGerenciarThrift
  require 'thrift'

  require_relative './ficha_atendimento_individual_types'
  require_relative '../common_types'

  def initialize(individual_call)
    @individual_call = individual_call
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

        obj_instance.send("#{each_method}=", @individual_call[method_sym]) unless @individual_call[method_sym].nil?
      end
    end

    fill_instance_methods_with_array = -> (array, methods, class_thirft) do
      array.each do |record_data|
        instance_thirft = class_thirft.new

        methods.each do |each_method|
          method_sym = each_method.to_sym

          instance_thirft.send("#{each_method}=", record_data[method_sym]) unless each_familia[method_sym].nil?
        end

        return instance_thirft
      end
    end

    exame_class = Br::Gov::Saude::Esusab::Ras::Atendindividual::ExameThrift
    problema_condicao_avaliacao_class = Br::Gov::Saude::Esusab::Ras::Atendindividual::ProblemaCondicaoAvaliacaoAIThrift
    ficha_individual_child_class = Br::Gov::Saude::Esusab::Ras::Atendindividual::FichaAtendimentoIndividualChildThrift
    ficha_individual_master_class = Br::Gov::Saude::Esusab::Ras::Atendindividual::FichaAtendimentoIndividualMasterThrift

    exame_methods = get_methods(exame_class)
    problema_condicao_avaliacao_methods = get_methods(problema_condicao_avaliacao_class)
    ficha_individual_child_methods = get_methods(ficha_individual_child_class)
    ficha_individual_master_methods = get_methods(ficha_individual_master_class)

    exame_instance = exame_class.new
    problema_condicao_avaliacao_instance = problema_condicao_avaliacao_class.new
    ficha_individual_child_instance = ficha_individual_child_class.new
    ficha_individual_master_instance = ficha_individual_master_class.new

    fill_instance_methods.call(condicao_saude_methods, condicao_saude_instance)
    fill_instance_methods.call(em_situacao_rua_methods, em_situacao_rua_instance)
    fill_instance_methods.call(identificacao_usuario_cidadao_methods, identificacao_usuario_cidadao_instance)
    fill_instance_methods.call(informacoes_sociodemograficas_methods, informacoes_sociodemograficas_instance)
    fill_instance_methods.call(saida_cidadao_cadastro_methods, saida_cidadao_cadastro_instance)
    fill_instance_methods.call(cadastro_individual_methods, cadastro_individual_instance)

    ficha_individual_child_array = fill_instance_methods_with_array.call(@household_registration.families, familia_row_methods, familia_row_class)

    cadastro_individual_instance.condicoesDeSaude = condicao_saude_instance
    cadastro_individual_instance.emSituacaoDeRua = em_situacao_rua_instance
    cadastro_individual_instance.identificacaoUsuarioCidadao = identificacao_usuario_cidadao_instance
    cadastro_individual_instance.informacoesSocioDemograficas = informacoes_sociodemograficas_instance
    cadastro_individual_instance.saidaCidadaoCadastro = saida_cidadao_cadastro_instance

    serializer = Thrift::Serializer.new

    cadastro_individual_serializado = serializer.serialize(cadastro_individual_instance)

    cadastro_individual_serializado
  end

end
