require "application_system_test_case"

class IndividualRegistrationsTest < ApplicationSystemTestCase
  setup do
    @individual_registration = individual_registrations(:one)
  end

  test "visiting the index" do
    visit individual_registrations_url
    assert_selector "h1", text: "Individual Registrations"
  end

  test "creating a Individual registration" do
    visit individual_registrations_url
    click_on "New Individual Registration"

    fill_in "Acamado", with: @individual_registration.acamado
    fill_in "Alguma internacao ultimos 12 meses", with: @individual_registration.alguma_internacao_ultimos_12_meses
    fill_in "Avc derrame", with: @individual_registration.avc_derrame
    fill_in "Cns cpf cidadao", with: @individual_registration.cns_cpf_cidadao
    fill_in "Cns cpf responsavel familiar", with: @individual_registration.cns_cpf_responsavel_familiar
    fill_in "Curso elevado frequenta frequentou", with: @individual_registration.curso_elevado_frequenta_frequentou
    fill_in "Data nascimento", with: @individual_registration.data_nascimento
    fill_in "Data naturalizacao", with: @individual_registration.data_naturalizacao
    fill_in "Diabetes", with: @individual_registration.diabetes
    fill_in "Diagnostico algum problema saude mental profissional saude", with: @individual_registration.diagnostico_algum_problema_saude_mental_profissional_saude
    fill_in "Domiciliado", with: @individual_registration.domiciliado
    fill_in "Email", with: @individual_registration.email
    fill_in "Etnia", with: @individual_registration.etnia
    fill_in "Frequenta cuidador tradicional", with: @individual_registration.frequenta_cuidador_tradicional
    fill_in "Fumante", with: @individual_registration.fumante
    fill_in "Gestante", with: @individual_registration.gestante
    fill_in "Hanseniase", with: @individual_registration.hanseniase
    fill_in "Hipertensao arterial", with: @individual_registration.hipertensao_arterial
    fill_in "Identidade genero", with: @individual_registration.identidade_genero
    fill_in "Infarto", with: @individual_registration.infarto
    fill_in "Municipio uf nascimento", with: @individual_registration.municipio_uf_nascimento
    fill_in "Nacionalidade", with: @individual_registration.nacionalidade
    fill_in "Nome completo", with: @individual_registration.nome_completo
    fill_in "Nome completo mae", with: @individual_registration.nome_completo_mae
    fill_in "Nome completo pai", with: @individual_registration.nome_completo_pai
    fill_in "Orientacao sexual", with: @individual_registration.orientacao_sexual
    fill_in "Outras praticas integrativas complementares", with: @individual_registration.outras_praticas_integrativas_complementares
    fill_in "Pais nascimento", with: @individual_registration.pais_nascimento
    fill_in "Participa grupo comunitario", with: @individual_registration.participa_grupo_comunitario
    fill_in "Peso", with: @individual_registration.peso
    fill_in "Pis pasep", with: @individual_registration.pis_pasep
    fill_in "Possui plano saude privado", with: @individual_registration.possui_plano_saude_privado
    fill_in "Possui referencia familiar", with: @individual_registration.possui_referencia_familiar
    fill_in "Raca cor", with: @individual_registration.raca_cor
    fill_in "Recebe algum beneficio", with: @individual_registration.recebe_algum_beneficio
    fill_in "Relacao parentesco responsavel familiar", with: @individual_registration.relacao_parentesco_responsavel_familiar
    fill_in "Saida cidadao cadastro", with: @individual_registration.saida_cidadao_cadastro
    fill_in "Sexo", with: @individual_registration.sexo
    fill_in "Situacao mercado trabalho", with: @individual_registration.situacao_mercado_trabalho
    fill_in "Situacao rua", with: @individual_registration.situacao_rua
    fill_in "Telefone celular", with: @individual_registration.telefone_celular
    fill_in "Tem ou teve cancer", with: @individual_registration.tem_ou_teve_cancer
    fill_in "Tuberculose", with: @individual_registration.tuberculose
    fill_in "Uso alcool", with: @individual_registration.uso_alcool
    fill_in "Uso outras drogas", with: @individual_registration.uso_outras_drogas
    click_on "Create Individual registration"

    assert_text "Individual registration was successfully created"
    click_on "Back"
  end

  test "updating a Individual registration" do
    visit individual_registrations_url
    click_on "Edit", match: :first

    fill_in "Acamado", with: @individual_registration.acamado
    fill_in "Alguma internacao ultimos 12 meses", with: @individual_registration.alguma_internacao_ultimos_12_meses
    fill_in "Avc derrame", with: @individual_registration.avc_derrame
    fill_in "Cns cpf cidadao", with: @individual_registration.cns_cpf_cidadao
    fill_in "Cns cpf responsavel familiar", with: @individual_registration.cns_cpf_responsavel_familiar
    fill_in "Curso elevado frequenta frequentou", with: @individual_registration.curso_elevado_frequenta_frequentou
    fill_in "Data nascimento", with: @individual_registration.data_nascimento
    fill_in "Data naturalizacao", with: @individual_registration.data_naturalizacao
    fill_in "Diabetes", with: @individual_registration.diabetes
    fill_in "Diagnostico algum problema saude mental profissional saude", with: @individual_registration.diagnostico_algum_problema_saude_mental_profissional_saude
    fill_in "Domiciliado", with: @individual_registration.domiciliado
    fill_in "Email", with: @individual_registration.email
    fill_in "Etnia", with: @individual_registration.etnia
    fill_in "Frequenta cuidador tradicional", with: @individual_registration.frequenta_cuidador_tradicional
    fill_in "Fumante", with: @individual_registration.fumante
    fill_in "Gestante", with: @individual_registration.gestante
    fill_in "Hanseniase", with: @individual_registration.hanseniase
    fill_in "Hipertensao arterial", with: @individual_registration.hipertensao_arterial
    fill_in "Identidade genero", with: @individual_registration.identidade_genero
    fill_in "Infarto", with: @individual_registration.infarto
    fill_in "Municipio uf nascimento", with: @individual_registration.municipio_uf_nascimento
    fill_in "Nacionalidade", with: @individual_registration.nacionalidade
    fill_in "Nome completo", with: @individual_registration.nome_completo
    fill_in "Nome completo mae", with: @individual_registration.nome_completo_mae
    fill_in "Nome completo pai", with: @individual_registration.nome_completo_pai
    fill_in "Orientacao sexual", with: @individual_registration.orientacao_sexual
    fill_in "Outras praticas integrativas complementares", with: @individual_registration.outras_praticas_integrativas_complementares
    fill_in "Pais nascimento", with: @individual_registration.pais_nascimento
    fill_in "Participa grupo comunitario", with: @individual_registration.participa_grupo_comunitario
    fill_in "Peso", with: @individual_registration.peso
    fill_in "Pis pasep", with: @individual_registration.pis_pasep
    fill_in "Possui plano saude privado", with: @individual_registration.possui_plano_saude_privado
    fill_in "Possui referencia familiar", with: @individual_registration.possui_referencia_familiar
    fill_in "Raca cor", with: @individual_registration.raca_cor
    fill_in "Recebe algum beneficio", with: @individual_registration.recebe_algum_beneficio
    fill_in "Relacao parentesco responsavel familiar", with: @individual_registration.relacao_parentesco_responsavel_familiar
    fill_in "Saida cidadao cadastro", with: @individual_registration.saida_cidadao_cadastro
    fill_in "Sexo", with: @individual_registration.sexo
    fill_in "Situacao mercado trabalho", with: @individual_registration.situacao_mercado_trabalho
    fill_in "Situacao rua", with: @individual_registration.situacao_rua
    fill_in "Telefone celular", with: @individual_registration.telefone_celular
    fill_in "Tem ou teve cancer", with: @individual_registration.tem_ou_teve_cancer
    fill_in "Tuberculose", with: @individual_registration.tuberculose
    fill_in "Uso alcool", with: @individual_registration.uso_alcool
    fill_in "Uso outras drogas", with: @individual_registration.uso_outras_drogas
    click_on "Update Individual registration"

    assert_text "Individual registration was successfully updated"
    click_on "Back"
  end

  test "destroying a Individual registration" do
    visit individual_registrations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Individual registration was successfully destroyed"
  end
end
