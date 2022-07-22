require "test_helper"

class CollectiveActivitySheetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collective_activity_sheet = collective_activity_sheets(:one)
  end

  test "should get index" do
    get collective_activity_sheets_url
    assert_response :success
  end

  test "should get new" do
    get new_collective_activity_sheet_url
    assert_response :success
  end

  test "should create collective_activity_sheet" do
    assert_difference('CollectiveActivitySheet.count') do
      post collective_activity_sheets_url, params: { collective_activity_sheet: { atividadeTipo: @collective_activity_sheet.atividadeTipo, inep: @collective_activity_sheet.inep, numAvaliacoesAlterada: @collective_activity_sheet.numAvaliacoesAlterada, numParticipantes: @collective_activity_sheet.numParticipantes, participant_id: @collective_activity_sheet.participant_id, praticasEmSaude: @collective_activity_sheet.praticasEmSaude, procedimento: @collective_activity_sheet.procedimento, professional_id: @collective_activity_sheet.professional_id, pseEducacao: @collective_activity_sheet.pseEducacao, pseSaude: @collective_activity_sheet.pseSaude, publicoAlvo: @collective_activity_sheet.publicoAlvo, tbCdsOrigem: @collective_activity_sheet.tbCdsOrigem, temasParaSaude: @collective_activity_sheet.temasParaSaude, turno: @collective_activity_sheet.turno, uuidFicha: @collective_activity_sheet.uuidFicha } }
    end

    assert_redirected_to collective_activity_sheet_url(CollectiveActivitySheet.last)
  end

  test "should show collective_activity_sheet" do
    get collective_activity_sheet_url(@collective_activity_sheet)
    assert_response :success
  end

  test "should get edit" do
    get edit_collective_activity_sheet_url(@collective_activity_sheet)
    assert_response :success
  end

  test "should update collective_activity_sheet" do
    patch collective_activity_sheet_url(@collective_activity_sheet), params: { collective_activity_sheet: { atividadeTipo: @collective_activity_sheet.atividadeTipo, inep: @collective_activity_sheet.inep, numAvaliacoesAlterada: @collective_activity_sheet.numAvaliacoesAlterada, numParticipantes: @collective_activity_sheet.numParticipantes, participant_id: @collective_activity_sheet.participant_id, praticasEmSaude: @collective_activity_sheet.praticasEmSaude, procedimento: @collective_activity_sheet.procedimento, professional_id: @collective_activity_sheet.professional_id, pseEducacao: @collective_activity_sheet.pseEducacao, pseSaude: @collective_activity_sheet.pseSaude, publicoAlvo: @collective_activity_sheet.publicoAlvo, tbCdsOrigem: @collective_activity_sheet.tbCdsOrigem, temasParaSaude: @collective_activity_sheet.temasParaSaude, turno: @collective_activity_sheet.turno, uuidFicha: @collective_activity_sheet.uuidFicha } }
    assert_redirected_to collective_activity_sheet_url(@collective_activity_sheet)
  end

  test "should destroy collective_activity_sheet" do
    assert_difference('CollectiveActivitySheet.count', -1) do
      delete collective_activity_sheet_url(@collective_activity_sheet)
    end

    assert_redirected_to collective_activity_sheets_url
  end
end
