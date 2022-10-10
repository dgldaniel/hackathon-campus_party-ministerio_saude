require "application_system_test_case"

class FamiliesTest < ApplicationSystemTestCase
  setup do
    @family = families(:one)
  end

  test "visiting the index" do
    visit families_url
    assert_selector "h1", text: "Families"
  end

  test "creating a Family" do
    visit families_url
    click_on "New Family"

    fill_in "Datanascimentoresponsavel", with: @family.dataNascimentoResponsavel
    fill_in "Numerocnsresponsavel", with: @family.numeroCnsResponsavel
    fill_in "Numeromembrosfamilia", with: @family.numeroMembrosFamilia
    fill_in "Numeroprontuario", with: @family.numeroProntuario
    fill_in "References", with: @family.references
    fill_in "Rendafamiliar", with: @family.rendaFamiliar
    fill_in "Residedesde", with: @family.resideDesde
    check "Stmudanca" if @family.stMudanca
    click_on "Create Family"

    assert_text "Family was successfully created"
    click_on "Back"
  end

  test "updating a Family" do
    visit families_url
    click_on "Edit", match: :first

    fill_in "Datanascimentoresponsavel", with: @family.dataNascimentoResponsavel
    fill_in "Numerocnsresponsavel", with: @family.numeroCnsResponsavel
    fill_in "Numeromembrosfamilia", with: @family.numeroMembrosFamilia
    fill_in "Numeroprontuario", with: @family.numeroProntuario
    fill_in "References", with: @family.references
    fill_in "Rendafamiliar", with: @family.rendaFamiliar
    fill_in "Residedesde", with: @family.resideDesde
    check "Stmudanca" if @family.stMudanca
    click_on "Update Family"

    assert_text "Family was successfully updated"
    click_on "Back"
  end

  test "destroying a Family" do
    visit families_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Family was successfully destroyed"
  end
end
