require "application_system_test_case"

class IndividualCallMastersTest < ApplicationSystemTestCase
  setup do
    @individual_call_master = individual_call_masters(:one)
  end

  test "visiting the index" do
    visit individual_call_masters_url
    assert_selector "h1", text: "Individual Call Masters"
  end

  test "creating a Individual call master" do
    visit individual_call_masters_url
    click_on "New Individual Call Master"

    fill_in "Tpcdsorigem", with: @individual_call_master.tpCdsOrigem
    fill_in "Uuid", with: @individual_call_master.uuid
    click_on "Create Individual call master"

    assert_text "Individual call master was successfully created"
    click_on "Back"
  end

  test "updating a Individual call master" do
    visit individual_call_masters_url
    click_on "Edit", match: :first

    fill_in "Tpcdsorigem", with: @individual_call_master.tpCdsOrigem
    fill_in "Uuid", with: @individual_call_master.uuid
    click_on "Update Individual call master"

    assert_text "Individual call master was successfully updated"
    click_on "Back"
  end

  test "destroying a Individual call master" do
    visit individual_call_masters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Individual call master was successfully destroyed"
  end
end
