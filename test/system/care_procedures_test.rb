require "application_system_test_case"

class CareProceduresTest < ApplicationSystemTestCase
  setup do
    @care_procedure = care_procedures(:one)
  end

  test "visiting the index" do
    visit care_procedures_url
    assert_selector "h1", text: "Care Procedures"
  end

  test "creating a Care procedure" do
    visit care_procedures_url
    click_on "New Care Procedure"

    fill_in "Alturaacompanhamentonutricional", with: @care_procedure.alturaAcompanhamentoNutricional
    fill_in "Cnscidadao", with: @care_procedure.cnsCidadao
    fill_in "Datahorafinalatendimento", with: @care_procedure.dataHoraFinalAtendimento
    fill_in "Datahorainicialatendimento", with: @care_procedure.dataHoraInicialAtendimento
    fill_in "Dtnascimento", with: @care_procedure.dtNascimento
    fill_in "Localatendimento", with: @care_procedure.localAtendimento
    fill_in "Numprontuario", with: @care_procedure.numProntuario
    fill_in "Pesoacompanhamentonutricional", with: @care_procedure.pesoAcompanhamentoNutricional
    fill_in "Procedimentos", with: @care_procedure.procedimentos
    fill_in "Sexo", with: @care_procedure.sexo
    check "Statusescutainicialorientacao" if @care_procedure.statusEscutaInicialOrientacao
    fill_in "Turn", with: @care_procedure.turn
    click_on "Create Care procedure"

    assert_text "Care procedure was successfully created"
    click_on "Back"
  end

  test "updating a Care procedure" do
    visit care_procedures_url
    click_on "Edit", match: :first

    fill_in "Alturaacompanhamentonutricional", with: @care_procedure.alturaAcompanhamentoNutricional
    fill_in "Cnscidadao", with: @care_procedure.cnsCidadao
    fill_in "Datahorafinalatendimento", with: @care_procedure.dataHoraFinalAtendimento
    fill_in "Datahorainicialatendimento", with: @care_procedure.dataHoraInicialAtendimento
    fill_in "Dtnascimento", with: @care_procedure.dtNascimento
    fill_in "Localatendimento", with: @care_procedure.localAtendimento
    fill_in "Numprontuario", with: @care_procedure.numProntuario
    fill_in "Pesoacompanhamentonutricional", with: @care_procedure.pesoAcompanhamentoNutricional
    fill_in "Procedimentos", with: @care_procedure.procedimentos
    fill_in "Sexo", with: @care_procedure.sexo
    check "Statusescutainicialorientacao" if @care_procedure.statusEscutaInicialOrientacao
    fill_in "Turn", with: @care_procedure.turn
    click_on "Update Care procedure"

    assert_text "Care procedure was successfully updated"
    click_on "Back"
  end

  test "destroying a Care procedure" do
    visit care_procedures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Care procedure was successfully destroyed"
  end
end
