require "test_helper"

class CollectiveCallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collective_call = collective_calls(:one)
  end

  test "should get index" do
    get collective_calls_url
    assert_response :success
  end

  test "should get new" do
    get new_collective_call_url
    assert_response :success
  end

  test "should create collective_call" do
    assert_difference('CollectiveCall.count') do
      post collective_calls_url, params: { collective_call: { Participant_id: @collective_call.Participant_id, Professional_id: @collective_call.Professional_id, atividadeTipo: @collective_call.atividadeTipo, inep: @collective_call.inep, numAvaliacoesAlteradas: @collective_call.numAvaliacoesAlteradas, numParticipantes: @collective_call.numParticipantes, praticasEmSaude: @collective_call.praticasEmSaude, procedimento: @collective_call.procedimento, pseEducacao: @collective_call.pseEducacao, pseSaude: @collective_call.pseSaude, publicoAlvo: @collective_call.publicoAlvo, tbCdsOrigem: @collective_call.tbCdsOrigem, temasParaSaude: @collective_call.temasParaSaude, turno: @collective_call.turno, uuidFicha: @collective_call.uuidFicha } }
    end

    assert_redirected_to collective_call_url(CollectiveCall.last)
  end

  test "should show collective_call" do
    get collective_call_url(@collective_call)
    assert_response :success
  end

  test "should get edit" do
    get edit_collective_call_url(@collective_call)
    assert_response :success
  end

  test "should update collective_call" do
    patch collective_call_url(@collective_call), params: { collective_call: { Participant_id: @collective_call.Participant_id, Professional_id: @collective_call.Professional_id, atividadeTipo: @collective_call.atividadeTipo, inep: @collective_call.inep, numAvaliacoesAlteradas: @collective_call.numAvaliacoesAlteradas, numParticipantes: @collective_call.numParticipantes, praticasEmSaude: @collective_call.praticasEmSaude, procedimento: @collective_call.procedimento, pseEducacao: @collective_call.pseEducacao, pseSaude: @collective_call.pseSaude, publicoAlvo: @collective_call.publicoAlvo, tbCdsOrigem: @collective_call.tbCdsOrigem, temasParaSaude: @collective_call.temasParaSaude, turno: @collective_call.turno, uuidFicha: @collective_call.uuidFicha } }
    assert_redirected_to collective_call_url(@collective_call)
  end

  test "should destroy collective_call" do
    assert_difference('CollectiveCall.count', -1) do
      delete collective_call_url(@collective_call)
    end

    assert_redirected_to collective_calls_url
  end
end
