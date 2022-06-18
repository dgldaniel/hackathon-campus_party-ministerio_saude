require "test_helper"

class IndividualRegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @individual_registration = individual_registrations(:one)
  end

  test "should get index" do
    get individual_registrations_url
    assert_response :success
  end

  test "should get new" do
    get new_individual_registration_url
    assert_response :success
  end

  test "should create individual_registration" do
    assert_difference('IndividualRegistration.count') do
      post individual_registrations_url, params: { individual_registration: { acamado: @individual_registration.acamado, alguma_internacao_ultimos_12_meses: @individual_registration.alguma_internacao_ultimos_12_meses, avc_derrame: @individual_registration.avc_derrame, cns_cpf_cidadao: @individual_registration.cns_cpf_cidadao, cns_cpf_responsavel_familiar: @individual_registration.cns_cpf_responsavel_familiar, curso_elevado_frequenta_frequentou: @individual_registration.curso_elevado_frequenta_frequentou, data_nascimento: @individual_registration.data_nascimento, data_naturalizacao: @individual_registration.data_naturalizacao, diabetes: @individual_registration.diabetes, diagnostico_algum_problema_saude_mental_profissional_saude: @individual_registration.diagnostico_algum_problema_saude_mental_profissional_saude, domiciliado: @individual_registration.domiciliado, email: @individual_registration.email, etnia: @individual_registration.etnia, frequenta_cuidador_tradicional: @individual_registration.frequenta_cuidador_tradicional, fumante: @individual_registration.fumante, gestante: @individual_registration.gestante, hanseniase: @individual_registration.hanseniase, hipertensao_arterial: @individual_registration.hipertensao_arterial, identidade_genero: @individual_registration.identidade_genero, infarto: @individual_registration.infarto, municipio_uf_nascimento: @individual_registration.municipio_uf_nascimento, nacionalidade: @individual_registration.nacionalidade, nome_completo: @individual_registration.nome_completo, nome_completo_mae: @individual_registration.nome_completo_mae, nome_completo_pai: @individual_registration.nome_completo_pai, orientacao_sexual: @individual_registration.orientacao_sexual, outras_praticas_integrativas_complementares: @individual_registration.outras_praticas_integrativas_complementares, pais_nascimento: @individual_registration.pais_nascimento, participa_grupo_comunitario: @individual_registration.participa_grupo_comunitario, peso: @individual_registration.peso, pis_pasep: @individual_registration.pis_pasep, possui_plano_saude_privado: @individual_registration.possui_plano_saude_privado, possui_referencia_familiar: @individual_registration.possui_referencia_familiar, raca_cor: @individual_registration.raca_cor, recebe_algum_beneficio: @individual_registration.recebe_algum_beneficio, relacao_parentesco_responsavel_familiar: @individual_registration.relacao_parentesco_responsavel_familiar, saida_cidadao_cadastro: @individual_registration.saida_cidadao_cadastro, sexo: @individual_registration.sexo, situacao_mercado_trabalho: @individual_registration.situacao_mercado_trabalho, situacao_rua: @individual_registration.situacao_rua, telefone_celular: @individual_registration.telefone_celular, tem_ou_teve_cancer: @individual_registration.tem_ou_teve_cancer, tuberculose: @individual_registration.tuberculose, uso_alcool: @individual_registration.uso_alcool, uso_outras_drogas: @individual_registration.uso_outras_drogas } }
    end

    assert_redirected_to individual_registration_url(IndividualRegistration.last)
  end

  test "should show individual_registration" do
    get individual_registration_url(@individual_registration)
    assert_response :success
  end

  test "should get edit" do
    get edit_individual_registration_url(@individual_registration)
    assert_response :success
  end

  test "should update individual_registration" do
    patch individual_registration_url(@individual_registration), params: { individual_registration: { acamado: @individual_registration.acamado, alguma_internacao_ultimos_12_meses: @individual_registration.alguma_internacao_ultimos_12_meses, avc_derrame: @individual_registration.avc_derrame, cns_cpf_cidadao: @individual_registration.cns_cpf_cidadao, cns_cpf_responsavel_familiar: @individual_registration.cns_cpf_responsavel_familiar, curso_elevado_frequenta_frequentou: @individual_registration.curso_elevado_frequenta_frequentou, data_nascimento: @individual_registration.data_nascimento, data_naturalizacao: @individual_registration.data_naturalizacao, diabetes: @individual_registration.diabetes, diagnostico_algum_problema_saude_mental_profissional_saude: @individual_registration.diagnostico_algum_problema_saude_mental_profissional_saude, domiciliado: @individual_registration.domiciliado, email: @individual_registration.email, etnia: @individual_registration.etnia, frequenta_cuidador_tradicional: @individual_registration.frequenta_cuidador_tradicional, fumante: @individual_registration.fumante, gestante: @individual_registration.gestante, hanseniase: @individual_registration.hanseniase, hipertensao_arterial: @individual_registration.hipertensao_arterial, identidade_genero: @individual_registration.identidade_genero, infarto: @individual_registration.infarto, municipio_uf_nascimento: @individual_registration.municipio_uf_nascimento, nacionalidade: @individual_registration.nacionalidade, nome_completo: @individual_registration.nome_completo, nome_completo_mae: @individual_registration.nome_completo_mae, nome_completo_pai: @individual_registration.nome_completo_pai, orientacao_sexual: @individual_registration.orientacao_sexual, outras_praticas_integrativas_complementares: @individual_registration.outras_praticas_integrativas_complementares, pais_nascimento: @individual_registration.pais_nascimento, participa_grupo_comunitario: @individual_registration.participa_grupo_comunitario, peso: @individual_registration.peso, pis_pasep: @individual_registration.pis_pasep, possui_plano_saude_privado: @individual_registration.possui_plano_saude_privado, possui_referencia_familiar: @individual_registration.possui_referencia_familiar, raca_cor: @individual_registration.raca_cor, recebe_algum_beneficio: @individual_registration.recebe_algum_beneficio, relacao_parentesco_responsavel_familiar: @individual_registration.relacao_parentesco_responsavel_familiar, saida_cidadao_cadastro: @individual_registration.saida_cidadao_cadastro, sexo: @individual_registration.sexo, situacao_mercado_trabalho: @individual_registration.situacao_mercado_trabalho, situacao_rua: @individual_registration.situacao_rua, telefone_celular: @individual_registration.telefone_celular, tem_ou_teve_cancer: @individual_registration.tem_ou_teve_cancer, tuberculose: @individual_registration.tuberculose, uso_alcool: @individual_registration.uso_alcool, uso_outras_drogas: @individual_registration.uso_outras_drogas } }
    assert_redirected_to individual_registration_url(@individual_registration)
  end

  test "should destroy individual_registration" do
    assert_difference('IndividualRegistration.count', -1) do
      delete individual_registration_url(@individual_registration)
    end

    assert_redirected_to individual_registrations_url
  end
end
