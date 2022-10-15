# frozen_string_literal: true
namespace :store_records_on_cache do
  desc "TODO"
  task handle_store_cache: :environment do
    municipios_data = get_path_json('cadastro_individual', 'municipios')
    store_json_cache(municipios_data, { first: 'Nome', second: 'Código IBGE' }, '@CI_Municipio')

    nacionalidade_data = get_path_json('cadastro_individual', 'nacionalidade')
    store_json_cache(nacionalidade_data, { first: 'Descrição', second: 'Código' }, '@CI_Nacionalidade')

    pais_data = get_path_json('cadastro_individual', 'pais')
    store_json_cache(pais_data, { first: 'Nome', second: 'Código' }, '@CI_Pais')

    raca_cor_data = get_path_json('cadastro_individual', 'raca_cor')
    store_json_cache(raca_cor_data, { first: 'Descrição', second: 'Código' }, '@CI_Raca_Cor')

    sexo_data = get_path_json('cadastro_individual', 'sexo')
    store_json_cache(sexo_data, { first: 'Descrição', second: 'Código' }, '@CI_Sexo')

    doenca_cardiaca_data = get_path_json('cadastro_individual', 'doenca_cardiaca')
    store_json_cache(doenca_cardiaca_data, { first: 'Descrição', second: 'Código' }, '@CI_Doenca_Cardiaca')

    doenca_respiratoria_data = get_path_json('cadastro_individual', 'doenca_respiratoria')
    store_json_cache(doenca_respiratoria_data, { first: 'Descrição', second: 'Código' }, '@CI_Doenca_Respiratoria')

    problema_rins_data = get_path_json('cadastro_individual', 'problema_rins')
    store_json_cache(problema_rins_data, { first: 'Descrição', second: 'Código' }, '@CI_Problema_Rins')

    situacao_peso_data = get_path_json('cadastro_individual', 'situacao_peso')
    store_json_cache(situacao_peso_data, { first: 'Descrição', second: 'Código' }, '@CI_Situacao_Peso')

    acesso_higiene_data = get_path_json('cadastro_individual', 'acesso_higiene')
    store_json_cache(acesso_higiene_data, { first: 'Descrição', second: 'Código' }, '@CI_Acesso_Higiene')

    origem_alimento_data = get_path_json('cadastro_individual', 'origem_alimento')
    store_json_cache(origem_alimento_data, { first: 'Descrição', second: 'Código' }, '@CI_Origem_Alimento')

    quantas_vezes_alimentacao_data = get_path_json('cadastro_individual', 'quantas_vezes_alimentacao')
    store_json_cache(quantas_vezes_alimentacao_data, { first: 'Descrição', second: 'Código' }, '@CI_Quantas_Vezes_Alimentacao')

    tempo_situacao_rua_data = get_path_json('cadastro_individual', 'tempo_situacao_rua')
    store_json_cache(tempo_situacao_rua_data, { first: 'Descrição', second: 'Código' }, '@CI_Tempo_Situacao_Rua')

    deficiencia_cidadao_data = get_path_json('cadastro_individual', 'deficiencia_cidadao')
    store_json_cache(deficiencia_cidadao_data, { first: 'Descrição', second: 'Código' }, '@CI_Deficiencia_Cidadao')

    curso_mais_elevado_data = get_path_json('cadastro_individual', 'curso_mais_elevado')
    store_json_cache(curso_mais_elevado_data, { first: 'Descrição', second: 'Código' }, '@CI_Curso_Mais_Elevado')

    motivo_saida_data = get_path_json('cadastro_individual', 'motivo_saida')
    store_json_cache(motivo_saida_data, { first: 'Descrição', second: 'Código' }, '@CI_Motivo_Saida')

    cbo_data = get_path_json('cadastro_individual', 'cbo')
    store_json_cache(cbo_data, { first: 'Nome', second: 'Código 2002' }, '@CI_CBO')

    orientacao_sexual_data = get_path_json('cadastro_individual', 'orientacao_sexual')
    store_json_cache(orientacao_sexual_data, { first: 'Descrição', second: 'Código' }, '@CI_Orientacao_Sexual')

    relacao_parentesco_data = get_path_json('cadastro_individual', 'relacao_parentesco')
    store_json_cache(relacao_parentesco_data, { first: 'Descrição', second: 'Código' }, '@CI_Relacao_Parentesco')

    responsavel_crianca_data = get_path_json('cadastro_individual', 'responsavel_crianca')
    store_json_cache(responsavel_crianca_data, { first: 'Descrição', second: 'Código' }, '@CI_Responsavel_Crianca')

    situacao_mercado_trabalho_data = get_path_json('cadastro_individual', 'situacao_mercado_trabalho')
    store_json_cache(situacao_mercado_trabalho_data, { first: 'Descrição', second: 'Código' }, '@CI_Situacao_Mercado')

    # Ficha de Atendimento Individual

    aleitamento_materno_data = get_path_json('ficha_atendimento_individual', 'aleitamento_materno')
    store_json_cache(aleitamento_materno_data, { first: 'Descrição', second: 'Código' }, '@FAI_Aleitamento_Materno')

    conduta_encaminhamento_data = get_path_json('ficha_atendimento_individual', 'conduta_encaminhamento')
    store_json_cache(conduta_encaminhamento_data, { first: 'Descrição', second: 'Código' }, '@FAI_Conduta_Encaminhamento')

    lista_ciap_data = get_path_json('ficha_atendimento_individual', 'lista_ciap')
    store_json_cache(lista_ciap_data, { first: 'Descrição', second: 'Código' }, '@FAI_Lista_CIAP')

    lista_exame_solicitado_data = get_path_json('ficha_atendimento_individual', 'lista_exame_solicitado')
    store_json_cache(lista_exame_solicitado_data, { first: 'Descrição', second: 'Código' }, '@FAI_Lista_Exame_Solicitado')

    local_atendimento_data = get_path_json('ficha_atendimento_individual', 'local_atendimento')
    store_json_cache(local_atendimento_data, { first: 'Descrição', second: 'Código' }, '@FAI_Local_Atendimento')

    modalidade_ad_data = get_path_json('ficha_atendimento_individual', 'modalidade_ad')
    store_json_cache(modalidade_ad_data, { first: 'Descrição', second: 'Código' }, '@FAI_Modalidade_AD')

    nasf_data = get_path_json('ficha_atendimento_individual', 'nasf')
    store_json_cache(nasf_data, { first: 'Descrição', second: 'Código' }, '@FAI_NASF')

    praticas_integrativas_complementares_data = get_path_json('ficha_atendimento_individual', 'praticas_integrativas_complementares')
    store_json_cache(praticas_integrativas_complementares_data, { first: 'Descrição', second: 'Código' }, '@FAI_Praticas_Integrativas_Complementares')

    situacao_exame_data = get_path_json('ficha_atendimento_individual', 'situacao_exame')
    store_json_cache(situacao_exame_data, { first: 'Descrição', second: 'Código' }, '@FAI_Situacao_Exame')

    tipo_atendimento_data = get_path_json('ficha_atendimento_individual', 'tipo_atendimento')
    store_json_cache(tipo_atendimento_data, { first: 'Descrição', second: 'Código' }, '@FAI_Tipo_Atendimento')

    turno_data = get_path_json('ficha_atendimento_individual', 'turno')
    store_json_cache(turno_data, { first: 'Descrição', second: 'Código' }, '@FAI_Turno')

    pic_data = get_path_json('ficha_atendimento_individual', 'pic')
    store_json_cache(pic_data, { first: 'Descrição', second: 'Código' }, '@FAI_PIC')

    # Ficha de Procedimentos

    lista_procedimentos_data = get_path_json('ficha_procedimentos', 'lista_procedimentos')
    store_json_cache(lista_procedimentos_data, { first: 'Descrição', second: 'Código' }, '@FP_Lista_Procedimentos')

    # Cadastro Domiliciar

    abastecimento_agua_data = get_path_json('cadastro_domiciliar', 'abastecimento_agua')
    store_json_cache(abastecimento_agua_data, { first: 'Descrição', second: 'Código' }, '@CD_Abastecimento_Agua')

    acesso_domicilio_data = get_path_json('cadastro_domiciliar', 'acesso_domicilio')
    store_json_cache(acesso_domicilio_data, { first: 'Descrição', second: 'Código' }, '@CD_Acesso_Domicilio')

    animal_domicilio_data = get_path_json('cadastro_domiciliar', 'animal_domicilio')
    store_json_cache(animal_domicilio_data, { first: 'Descrição', second: 'Código' }, '@CD_Animal_Domicilio')

    destino_lixo_data = get_path_json('cadastro_domiciliar', 'destino_lixo')
    store_json_cache(destino_lixo_data, { first: 'Descrição', second: 'Código' }, '@CD_Destino_Lixo')

    escoamento_banheiro_data = get_path_json('cadastro_domiciliar', 'escoamento_banheiro')
    store_json_cache(escoamento_banheiro_data, { first: 'Descrição', second: 'Código' }, '@CD_Escoamento_Banheiro')

    estados_data = get_path_json('cadastro_domiciliar', 'estados')
    store_json_cache(estados_data, { first: 'Nome', second: 'Código DNE' }, '@CD_Estados')

    localizacao_moradia_data = get_path_json('cadastro_domiciliar', 'localizacao_moradia')
    store_json_cache(localizacao_moradia_data, { first: 'Descrição', second: 'Código' }, '@CD_Localizacao_Moradia')

    material_predominante_construcao_data = get_path_json('cadastro_domiciliar', 'material_predominante_construcao')
    store_json_cache(material_predominante_construcao_data, { first: 'Descrição', second: 'Código' }, '@CD_Material_Predominante_Construcao')

    posse_uso_terra_data = get_path_json('cadastro_domiciliar', 'posse_uso_terra')
    store_json_cache(posse_uso_terra_data, { first: 'Descrição', second: 'Código' }, '@CD_Posse_Uso_Terra')

    renda_familiar_data = get_path_json('cadastro_domiciliar', 'renda_familiar')
    store_json_cache(renda_familiar_data, { first: 'Descrição', second: 'Código' }, '@CD_Renda_Familiar')

    situacao_moradia_data = get_path_json('cadastro_domiciliar', 'situacao_moradia')
    store_json_cache(situacao_moradia_data, { first: 'Descrição', second: 'Código' }, '@CD_Situacao_Moradia')

    tipo_domicilio_data = get_path_json('cadastro_domiciliar', 'tipo_domicilio')
    store_json_cache(tipo_domicilio_data, { first: 'Descrição', second: 'Código' }, '@CD_Tipo_Domicilio')

    tipo_logradouro_data = get_path_json('cadastro_domiciliar', 'tipo_logradouro')
    store_json_cache(tipo_logradouro_data, { first: 'Nome', second: 'Código' }, '@CD_Tipo_Logradouro')

    tratamento_agua_domicilio_data = get_path_json('cadastro_domiciliar', 'tratamento_agua_domicilio')
    store_json_cache(tratamento_agua_domicilio_data, { first: 'Descrição', second: 'Código' }, '@CD_Tratamento_Agua_Domicilio')

    # Ficha de Atividade Coletiva

    praticas_tema_saude_data = get_path_json('ficha_atividade_coletiva', 'praticas_tema_saude')
    store_json_cache(praticas_tema_saude_data, { first: 'Descrição', second: 'Código' }, '@FAC_Pratica_Tema_Saude')

    publico_alvo_data = get_path_json('ficha_atividade_coletiva', 'publico_alvo')
    store_json_cache(publico_alvo_data, { first: 'Descrição', second: 'Código' }, '@FAC_Publico_Alvo')

    temas_reuniao_data = get_path_json('ficha_atividade_coletiva', 'temas_reuniao')
    store_json_cache(temas_reuniao_data, { first: 'Descrição', second: 'Código' }, '@FAC_Temas_Reuniao')

    tipo_atividade_coletiva_data = get_path_json('ficha_atividade_coletiva', 'tipo_atividade_coletiva')
    store_json_cache(tipo_atividade_coletiva_data, { first: 'Descrição', second: 'Código' }, '@FAC_Tipo_Atividade_Coletiva')
  end

  private

  def get_path_json(model, file)
    path_file = Rails.root.join('lib', 'esus', 'options', model, "#{file}.json")
    data = File.read(path_file)

    JSON.parse(data)
  end

  def store_json_cache(data_parsed, options, key_cache)
    data_options = data_parsed.map do |each_data|
      [each_data[options[:first]], each_data[options[:second]]]
    end

    Rails.cache.write(key_cache, data_options.to_s)
  end

end
