require "application_system_test_case"

class ParticipantsTest < ApplicationSystemTestCase
  setup do
    @participant = participants(:one)
  end

  test "visiting the index" do
    visit participants_url
    assert_selector "h1", text: "Participants"
  end

  test "creating a Participant" do
    visit participants_url
    click_on "New Participant"

    check "Abandonougrupo" if @participant.abandonouGrupo
    check "Avaliacaoalterada" if @participant.avaliacaoAlterada
    check "Cessouhabitofumar" if @participant.cessouHabitoFumar
    fill_in "Cnsparticipante", with: @participant.cnsParticipante
    fill_in "Datanascimento", with: @participant.dataNascimento
    fill_in "Sexo", with: @participant.sexo
    click_on "Create Participant"

    assert_text "Participant was successfully created"
    click_on "Back"
  end

  test "updating a Participant" do
    visit participants_url
    click_on "Edit", match: :first

    check "Abandonougrupo" if @participant.abandonouGrupo
    check "Avaliacaoalterada" if @participant.avaliacaoAlterada
    check "Cessouhabitofumar" if @participant.cessouHabitoFumar
    fill_in "Cnsparticipante", with: @participant.cnsParticipante
    fill_in "Datanascimento", with: @participant.dataNascimento
    fill_in "Sexo", with: @participant.sexo
    click_on "Update Participant"

    assert_text "Participant was successfully updated"
    click_on "Back"
  end

  test "destroying a Participant" do
    visit participants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Participant was successfully destroyed"
  end
end
