# frozen_string_literal: true
class CadastroIndividualGerenciarThrift
  require 'thrift'

  require_relative './cadastro_individual_types'
  require_relative '../common_types'

  def initialize(individual_registration)
    @individual_registration = individual_registration
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

        obj_instance.send("#{each_method}=", @individual_registration[method_sym]) unless @individual_registration[method_sym].nil?
      end
    end

    condicao_saude_class = Br::Gov::Saude::Esusab::Ras::Cadastroindividual::CondicoesDeSaudeThrift
    em_situacao_rua_class = Br::Gov::Saude::Esusab::Ras::Cadastroindividual::EmSituacaoDeRuaThrift
    identificacao_usuario_cidadao_class = Br::Gov::Saude::Esusab::Ras::Cadastroindividual::IdentificacaoUsuarioCidadaoThrift
    informacoes_sociodemograficas_class = Br::Gov::Saude::Esusab::Ras::Cadastroindividual::InformacoesSocioDemograficasThrift
    saida_cidadao_cadastro_class = Br::Gov::Saude::Esusab::Ras::Cadastroindividual::SaidaCidadaoCadastroThrift
    cadastro_individual_class = Br::Gov::Saude::Esusab::Ras::Cadastroindividual::CadastroIndividualThrift

    condicao_saude_methods = get_methods(condicao_saude_class)
    em_situacao_rua_methods = get_methods(em_situacao_rua_class)
    identificacao_usuario_cidadao_methods = get_methods(identificacao_usuario_cidadao_class)
    informacoes_sociodemograficas_methods = get_methods(informacoes_sociodemograficas_class)
    saida_cidadao_cadastro_methods = get_methods(saida_cidadao_cadastro_class)
    cadastro_individual_methods = get_methods(cadastro_individual_class)

    condicao_saude_instance = condicao_saude_class.new
    em_situacao_rua_instance = em_situacao_rua_class.new
    identificacao_usuario_cidadao_instance = identificacao_usuario_cidadao_class.new
    informacoes_sociodemograficas_instance = informacoes_sociodemograficas_class.new
    saida_cidadao_cadastro_instance = saida_cidadao_cadastro_class.new
    cadastro_individual_instance = cadastro_individual_class.new

    fill_instance_methods.call(condicao_saude_methods, condicao_saude_instance)
    fill_instance_methods.call(em_situacao_rua_methods, em_situacao_rua_instance)
    fill_instance_methods.call(identificacao_usuario_cidadao_methods, identificacao_usuario_cidadao_instance)
    fill_instance_methods.call(informacoes_sociodemograficas_methods, informacoes_sociodemograficas_instance)
    fill_instance_methods.call(saida_cidadao_cadastro_methods, saida_cidadao_cadastro_instance)
    fill_instance_methods.call(cadastro_individual_methods, cadastro_individual_instance)

    cadastro_individual_instance.condicoesDeSaude = condicao_saude_instance
    cadastro_individual_instance.emSituacaoDeRua = em_situacao_rua_instance
    cadastro_individual_instance.identificacaoUsuarioCidadao = identificacao_usuario_cidadao_instance
    cadastro_individual_instance.informacoesSocioDemograficas = informacoes_sociodemograficas_instance
    cadastro_individual_instance.saidaCidadaoCadastro = saida_cidadao_cadastro_instance

    cadastro_individual_instance.identificacaoUsuarioCidadao.dataNascimentoCidadao = cadastro_individual_instance.identificacaoUsuarioCidadao.dataNascimentoCidadao.nil? ? nil : @individual_registration.dataNascimentoCidadao.to_time.to_i
    cadastro_individual_instance.identificacaoUsuarioCidadao.dtNaturalizacao = cadastro_individual_instance.identificacaoUsuarioCidadao.dtNaturalizacao.nil? ? nil : @individual_registration.dtNaturalizacao.to_time.to_i
    cadastro_individual_instance.identificacaoUsuarioCidadao.dtEntradaBrasil = cadastro_individual_instance.identificacaoUsuarioCidadao.dtEntradaBrasil.nil? ? nil : @individual_registration.dtEntradaBrasil.to_time.to_i

    p cadastro_individual_instance.identificacaoUsuarioCidadao

    serializer = Thrift::Serializer.new

    cadastro_individual_serializado = serializer.serialize(cadastro_individual_instance)

    cadastro_individual_serializado
  end

end
