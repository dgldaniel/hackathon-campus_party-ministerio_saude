require "test_helper"

class ProcedureSheetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @procedure_sheet = procedure_sheets(:one)
  end

  test "should get index" do
    get procedure_sheets_url
    assert_response :success
  end

  test "should get new" do
    get new_procedure_sheet_url
    assert_response :success
  end

  test "should create procedure_sheet" do
    assert_difference('ProcedureSheet.count') do
      post procedure_sheets_url, params: { procedure_sheet: { numTotalAfericaoPa: @procedure_sheet.numTotalAfericaoPa, numTotalAfericaoTemperatura: @procedure_sheet.numTotalAfericaoTemperatura, numTotalColetaMaterialParaExameLaboratorial: @procedure_sheet.numTotalColetaMaterialParaExameLaboratorial, numTotalCurativoSimples: @procedure_sheet.numTotalCurativoSimples, numTotalGlicemiaCapilar: @procedure_sheet.numTotalGlicemiaCapilar, numTotalMedicaoAltura: @procedure_sheet.numTotalMedicaoAltura, numTotalMedicaoPeso: @procedure_sheet.numTotalMedicaoPeso, tpCdsOrigem: @procedure_sheet.tpCdsOrigem, uuidFicha: @procedure_sheet.uuidFicha } }
    end

    assert_redirected_to procedure_sheet_url(ProcedureSheet.last)
  end

  test "should show procedure_sheet" do
    get procedure_sheet_url(@procedure_sheet)
    assert_response :success
  end

  test "should get edit" do
    get edit_procedure_sheet_url(@procedure_sheet)
    assert_response :success
  end

  test "should update procedure_sheet" do
    patch procedure_sheet_url(@procedure_sheet), params: { procedure_sheet: { numTotalAfericaoPa: @procedure_sheet.numTotalAfericaoPa, numTotalAfericaoTemperatura: @procedure_sheet.numTotalAfericaoTemperatura, numTotalColetaMaterialParaExameLaboratorial: @procedure_sheet.numTotalColetaMaterialParaExameLaboratorial, numTotalCurativoSimples: @procedure_sheet.numTotalCurativoSimples, numTotalGlicemiaCapilar: @procedure_sheet.numTotalGlicemiaCapilar, numTotalMedicaoAltura: @procedure_sheet.numTotalMedicaoAltura, numTotalMedicaoPeso: @procedure_sheet.numTotalMedicaoPeso, tpCdsOrigem: @procedure_sheet.tpCdsOrigem, uuidFicha: @procedure_sheet.uuidFicha } }
    assert_redirected_to procedure_sheet_url(@procedure_sheet)
  end

  test "should destroy procedure_sheet" do
    assert_difference('ProcedureSheet.count', -1) do
      delete procedure_sheet_url(@procedure_sheet)
    end

    assert_redirected_to procedure_sheets_url
  end
end
