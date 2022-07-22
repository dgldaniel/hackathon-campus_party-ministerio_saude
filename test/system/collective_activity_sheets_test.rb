require "application_system_test_case"

class CollectiveActivitySheetsTest < ApplicationSystemTestCase
  setup do
    @collective_activity_sheet = collective_activity_sheets(:one)
  end

  test "visiting the index" do
    visit collective_activity_sheets_url
    assert_selector "h1", text: "Collective Activity Sheets"
  end

  test "creating a Collective activity sheet" do
    visit collective_activity_sheets_url
    click_on "New Collective Activity Sheet"

    fill_in "Atividadetipo", with: @collective_activity_sheet.atividadeTipo
    fill_in "Inep", with: @collective_activity_sheet.inep
    fill_in "Numavaliacoesalterada", with: @collective_activity_sheet.numAvaliacoesAlterada
    fill_in "Numparticipantes", with: @collective_activity_sheet.numParticipantes
    fill_in "Participant", with: @collective_activity_sheet.participant_id
    fill_in "Praticasemsaude", with: @collective_activity_sheet.praticasEmSaude
    fill_in "Procedimento", with: @collective_activity_sheet.procedimento
    fill_in "Professional", with: @collective_activity_sheet.professional_id
    check "Pseeducacao" if @collective_activity_sheet.pseEducacao
    check "Psesaude" if @collective_activity_sheet.pseSaude
    fill_in "Publicoalvo", with: @collective_activity_sheet.publicoAlvo
    fill_in "Tbcdsorigem", with: @collective_activity_sheet.tbCdsOrigem
    fill_in "Temasparasaude", with: @collective_activity_sheet.temasParaSaude
    fill_in "Turno", with: @collective_activity_sheet.turno
    fill_in "Uuidficha", with: @collective_activity_sheet.uuidFicha
    click_on "Create Collective activity sheet"

    assert_text "Collective activity sheet was successfully created"
    click_on "Back"
  end

  test "updating a Collective activity sheet" do
    visit collective_activity_sheets_url
    click_on "Edit", match: :first

    fill_in "Atividadetipo", with: @collective_activity_sheet.atividadeTipo
    fill_in "Inep", with: @collective_activity_sheet.inep
    fill_in "Numavaliacoesalterada", with: @collective_activity_sheet.numAvaliacoesAlterada
    fill_in "Numparticipantes", with: @collective_activity_sheet.numParticipantes
    fill_in "Participant", with: @collective_activity_sheet.participant_id
    fill_in "Praticasemsaude", with: @collective_activity_sheet.praticasEmSaude
    fill_in "Procedimento", with: @collective_activity_sheet.procedimento
    fill_in "Professional", with: @collective_activity_sheet.professional_id
    check "Pseeducacao" if @collective_activity_sheet.pseEducacao
    check "Psesaude" if @collective_activity_sheet.pseSaude
    fill_in "Publicoalvo", with: @collective_activity_sheet.publicoAlvo
    fill_in "Tbcdsorigem", with: @collective_activity_sheet.tbCdsOrigem
    fill_in "Temasparasaude", with: @collective_activity_sheet.temasParaSaude
    fill_in "Turno", with: @collective_activity_sheet.turno
    fill_in "Uuidficha", with: @collective_activity_sheet.uuidFicha
    click_on "Update Collective activity sheet"

    assert_text "Collective activity sheet was successfully updated"
    click_on "Back"
  end

  test "destroying a Collective activity sheet" do
    visit collective_activity_sheets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collective activity sheet was successfully destroyed"
  end
end
