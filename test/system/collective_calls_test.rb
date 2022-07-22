require "application_system_test_case"

class CollectiveCallsTest < ApplicationSystemTestCase
  setup do
    @collective_call = collective_calls(:one)
  end

  test "visiting the index" do
    visit collective_calls_url
    assert_selector "h1", text: "Collective Calls"
  end

  test "creating a Collective call" do
    visit collective_calls_url
    click_on "New Collective Call"

    fill_in "Participant", with: @collective_call.Participant_id
    fill_in "Professional", with: @collective_call.Professional_id
    fill_in "Atividadetipo", with: @collective_call.atividadeTipo
    fill_in "Inep", with: @collective_call.inep
    fill_in "Numavaliacoesalteradas", with: @collective_call.numAvaliacoesAlteradas
    fill_in "Numparticipantes", with: @collective_call.numParticipantes
    fill_in "Praticasemsaude", with: @collective_call.praticasEmSaude
    fill_in "Procedimento", with: @collective_call.procedimento
    check "Pseeducacao" if @collective_call.pseEducacao
    check "Psesaude" if @collective_call.pseSaude
    fill_in "Publicoalvo", with: @collective_call.publicoAlvo
    fill_in "Tbcdsorigem", with: @collective_call.tbCdsOrigem
    fill_in "Temasparasaude", with: @collective_call.temasParaSaude
    fill_in "Turno", with: @collective_call.turno
    fill_in "Uuidficha", with: @collective_call.uuidFicha
    click_on "Create Collective call"

    assert_text "Collective call was successfully created"
    click_on "Back"
  end

  test "updating a Collective call" do
    visit collective_calls_url
    click_on "Edit", match: :first

    fill_in "Participant", with: @collective_call.Participant_id
    fill_in "Professional", with: @collective_call.Professional_id
    fill_in "Atividadetipo", with: @collective_call.atividadeTipo
    fill_in "Inep", with: @collective_call.inep
    fill_in "Numavaliacoesalteradas", with: @collective_call.numAvaliacoesAlteradas
    fill_in "Numparticipantes", with: @collective_call.numParticipantes
    fill_in "Praticasemsaude", with: @collective_call.praticasEmSaude
    fill_in "Procedimento", with: @collective_call.procedimento
    check "Pseeducacao" if @collective_call.pseEducacao
    check "Psesaude" if @collective_call.pseSaude
    fill_in "Publicoalvo", with: @collective_call.publicoAlvo
    fill_in "Tbcdsorigem", with: @collective_call.tbCdsOrigem
    fill_in "Temasparasaude", with: @collective_call.temasParaSaude
    fill_in "Turno", with: @collective_call.turno
    fill_in "Uuidficha", with: @collective_call.uuidFicha
    click_on "Update Collective call"

    assert_text "Collective call was successfully updated"
    click_on "Back"
  end

  test "destroying a Collective call" do
    visit collective_calls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collective call was successfully destroyed"
  end
end
