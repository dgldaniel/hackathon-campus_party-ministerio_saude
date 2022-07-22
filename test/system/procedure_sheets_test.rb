require "application_system_test_case"

class ProcedureSheetsTest < ApplicationSystemTestCase
  setup do
    @procedure_sheet = procedure_sheets(:one)
  end

  test "visiting the index" do
    visit procedure_sheets_url
    assert_selector "h1", text: "Procedure Sheets"
  end

  test "creating a Procedure sheet" do
    visit procedure_sheets_url
    click_on "New Procedure Sheet"

    fill_in "Numtotalafericaopa", with: @procedure_sheet.numTotalAfericaoPa
    fill_in "Numtotalafericaotemperatura", with: @procedure_sheet.numTotalAfericaoTemperatura
    fill_in "Numtotalcoletamaterialparaexamelaboratorial", with: @procedure_sheet.numTotalColetaMaterialParaExameLaboratorial
    fill_in "Numtotalcurativosimples", with: @procedure_sheet.numTotalCurativoSimples
    fill_in "Numtotalglicemiacapilar", with: @procedure_sheet.numTotalGlicemiaCapilar
    fill_in "Numtotalmedicaoaltura", with: @procedure_sheet.numTotalMedicaoAltura
    fill_in "Numtotalmedicaopeso", with: @procedure_sheet.numTotalMedicaoPeso
    fill_in "Tpcdsorigem", with: @procedure_sheet.tpCdsOrigem
    fill_in "Uuidficha", with: @procedure_sheet.uuidFicha
    click_on "Create Procedure sheet"

    assert_text "Procedure sheet was successfully created"
    click_on "Back"
  end

  test "updating a Procedure sheet" do
    visit procedure_sheets_url
    click_on "Edit", match: :first

    fill_in "Numtotalafericaopa", with: @procedure_sheet.numTotalAfericaoPa
    fill_in "Numtotalafericaotemperatura", with: @procedure_sheet.numTotalAfericaoTemperatura
    fill_in "Numtotalcoletamaterialparaexamelaboratorial", with: @procedure_sheet.numTotalColetaMaterialParaExameLaboratorial
    fill_in "Numtotalcurativosimples", with: @procedure_sheet.numTotalCurativoSimples
    fill_in "Numtotalglicemiacapilar", with: @procedure_sheet.numTotalGlicemiaCapilar
    fill_in "Numtotalmedicaoaltura", with: @procedure_sheet.numTotalMedicaoAltura
    fill_in "Numtotalmedicaopeso", with: @procedure_sheet.numTotalMedicaoPeso
    fill_in "Tpcdsorigem", with: @procedure_sheet.tpCdsOrigem
    fill_in "Uuidficha", with: @procedure_sheet.uuidFicha
    click_on "Update Procedure sheet"

    assert_text "Procedure sheet was successfully updated"
    click_on "Back"
  end

  test "destroying a Procedure sheet" do
    visit procedure_sheets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Procedure sheet was successfully destroyed"
  end
end
