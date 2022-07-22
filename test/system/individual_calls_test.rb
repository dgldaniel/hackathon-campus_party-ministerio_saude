require "application_system_test_case"

class IndividualCallsTest < ApplicationSystemTestCase
  setup do
    @individual_call = individual_calls(:one)
  end

  test "visiting the index" do
    visit individual_calls_url
    assert_selector "h1", text: "Individual Calls"
  end

  test "creating a Individual call" do
    visit individual_calls_url
    click_on "New Individual Call"

    fill_in "Collectiveactivitysheet", with: @individual_call.CollectiveActivitySheet_id
    fill_in "Examresult", with: @individual_call.ExamResult_id
    fill_in "Exam", with: @individual_call.Exam_id
    fill_in "Forwarding", with: @individual_call.Forwarding_id
    fill_in "Medicine", with: @individual_call.Medicine_id
    fill_in "Participant", with: @individual_call.Participant_id
    fill_in "Professional", with: @individual_call.Professional_id
    fill_in "Aleitamentomaterno", with: @individual_call.aleitamentoMaterno
    fill_in "Alturaacompanhamentonutricional", with: @individual_call.alturaAcompanhamentoNutricional
    fill_in "Atencaodomiciliarmodalidade", with: @individual_call.atencaoDomiciliarModalidade
    fill_in "Cnscidadao", with: @individual_call.cnsCidadao
    fill_in "Condutas", with: @individual_call.condutas
    fill_in "Datahorafinalatendimento", with: @individual_call.dataHoraFinalAtendimento
    fill_in "Datahorainicialatendimento", with: @individual_call.dataHoraInicialAtendimento
    fill_in "Datanascimento", with: @individual_call.dataNascimento
    fill_in "Dumdagestante", with: @individual_call.dumDaGestante
    check "Ficouemobservacao" if @individual_call.ficouEmObservacao
    fill_in "Idadegestacional", with: @individual_call.idadeGestacional
    fill_in "Localdeatendimento", with: @individual_call.localDeAtendimento
    fill_in "Nasfs", with: @individual_call.nasfs
    fill_in "Nugestasprevias", with: @individual_call.nuGestasPrevias
    fill_in "Nupartos", with: @individual_call.nuPartos
    fill_in "Numeroprontuario", with: @individual_call.numeroProntuario
    fill_in "Perimetrocefalico", with: @individual_call.perimetroCefalico
    fill_in "Pesoacompanhamentonutricional", with: @individual_call.pesoAcompanhamentoNutricional
    fill_in "Racionalidadesaude", with: @individual_call.racionalidadeSaude
    fill_in "Sexo", with: @individual_call.sexo
    check "Stgravidezplanejada" if @individual_call.stGravidezPlanejada
    fill_in "Tipoatendimento", with: @individual_call.tipoAtendimento
    fill_in "Turno", with: @individual_call.turno
    check "Vacinaemdia" if @individual_call.vacinaEmDia
    click_on "Create Individual call"

    assert_text "Individual call was successfully created"
    click_on "Back"
  end

  test "updating a Individual call" do
    visit individual_calls_url
    click_on "Edit", match: :first

    fill_in "Collectiveactivitysheet", with: @individual_call.CollectiveActivitySheet_id
    fill_in "Examresult", with: @individual_call.ExamResult_id
    fill_in "Exam", with: @individual_call.Exam_id
    fill_in "Forwarding", with: @individual_call.Forwarding_id
    fill_in "Medicine", with: @individual_call.Medicine_id
    fill_in "Participant", with: @individual_call.Participant_id
    fill_in "Professional", with: @individual_call.Professional_id
    fill_in "Aleitamentomaterno", with: @individual_call.aleitamentoMaterno
    fill_in "Alturaacompanhamentonutricional", with: @individual_call.alturaAcompanhamentoNutricional
    fill_in "Atencaodomiciliarmodalidade", with: @individual_call.atencaoDomiciliarModalidade
    fill_in "Cnscidadao", with: @individual_call.cnsCidadao
    fill_in "Condutas", with: @individual_call.condutas
    fill_in "Datahorafinalatendimento", with: @individual_call.dataHoraFinalAtendimento
    fill_in "Datahorainicialatendimento", with: @individual_call.dataHoraInicialAtendimento
    fill_in "Datanascimento", with: @individual_call.dataNascimento
    fill_in "Dumdagestante", with: @individual_call.dumDaGestante
    check "Ficouemobservacao" if @individual_call.ficouEmObservacao
    fill_in "Idadegestacional", with: @individual_call.idadeGestacional
    fill_in "Localdeatendimento", with: @individual_call.localDeAtendimento
    fill_in "Nasfs", with: @individual_call.nasfs
    fill_in "Nugestasprevias", with: @individual_call.nuGestasPrevias
    fill_in "Nupartos", with: @individual_call.nuPartos
    fill_in "Numeroprontuario", with: @individual_call.numeroProntuario
    fill_in "Perimetrocefalico", with: @individual_call.perimetroCefalico
    fill_in "Pesoacompanhamentonutricional", with: @individual_call.pesoAcompanhamentoNutricional
    fill_in "Racionalidadesaude", with: @individual_call.racionalidadeSaude
    fill_in "Sexo", with: @individual_call.sexo
    check "Stgravidezplanejada" if @individual_call.stGravidezPlanejada
    fill_in "Tipoatendimento", with: @individual_call.tipoAtendimento
    fill_in "Turno", with: @individual_call.turno
    check "Vacinaemdia" if @individual_call.vacinaEmDia
    click_on "Update Individual call"

    assert_text "Individual call was successfully updated"
    click_on "Back"
  end

  test "destroying a Individual call" do
    visit individual_calls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Individual call was successfully destroyed"
  end
end
