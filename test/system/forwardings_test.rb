require "application_system_test_case"

class ForwardingsTest < ApplicationSystemTestCase
  setup do
    @forwarding = forwardings(:one)
  end

  test "visiting the index" do
    visit forwardings_url
    assert_selector "h1", text: "Forwardings"
  end

  test "creating a Forwarding" do
    visit forwardings_url
    click_on "New Forwarding"

    fill_in "Classificacaorisco", with: @forwarding.classificacaoRisco
    fill_in "Especialidade", with: @forwarding.especialidade
    fill_in "Hipotesediagnosticocid10", with: @forwarding.hipoteseDiagnosticoCid10
    click_on "Create Forwarding"

    assert_text "Forwarding was successfully created"
    click_on "Back"
  end

  test "updating a Forwarding" do
    visit forwardings_url
    click_on "Edit", match: :first

    fill_in "Classificacaorisco", with: @forwarding.classificacaoRisco
    fill_in "Especialidade", with: @forwarding.especialidade
    fill_in "Hipotesediagnosticocid10", with: @forwarding.hipoteseDiagnosticoCid10
    click_on "Update Forwarding"

    assert_text "Forwarding was successfully updated"
    click_on "Back"
  end

  test "destroying a Forwarding" do
    visit forwardings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forwarding was successfully destroyed"
  end
end
