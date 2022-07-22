require "test_helper"

class IndividualCallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @individual_call = individual_calls(:one)
  end

  test "should get index" do
    get individual_calls_url
    assert_response :success
  end

  test "should get new" do
    get new_individual_call_url
    assert_response :success
  end

  test "should create individual_call" do
    assert_difference('IndividualCall.count') do
      post individual_calls_url, params: { individual_call: { CollectiveActivitySheet_id: @individual_call.CollectiveActivitySheet_id, ExamResult_id: @individual_call.ExamResult_id, Exam_id: @individual_call.Exam_id, Forwarding_id: @individual_call.Forwarding_id, Medicine_id: @individual_call.Medicine_id, Participant_id: @individual_call.Participant_id, Professional_id: @individual_call.Professional_id, aleitamentoMaterno: @individual_call.aleitamentoMaterno, alturaAcompanhamentoNutricional: @individual_call.alturaAcompanhamentoNutricional, atencaoDomiciliarModalidade: @individual_call.atencaoDomiciliarModalidade, cnsCidadao: @individual_call.cnsCidadao, condutas: @individual_call.condutas, dataHoraFinalAtendimento: @individual_call.dataHoraFinalAtendimento, dataHoraInicialAtendimento: @individual_call.dataHoraInicialAtendimento, dataNascimento: @individual_call.dataNascimento, dumDaGestante: @individual_call.dumDaGestante, ficouEmObservacao: @individual_call.ficouEmObservacao, idadeGestacional: @individual_call.idadeGestacional, localDeAtendimento: @individual_call.localDeAtendimento, nasfs: @individual_call.nasfs, nuGestasPrevias: @individual_call.nuGestasPrevias, nuPartos: @individual_call.nuPartos, numeroProntuario: @individual_call.numeroProntuario, perimetroCefalico: @individual_call.perimetroCefalico, pesoAcompanhamentoNutricional: @individual_call.pesoAcompanhamentoNutricional, racionalidadeSaude: @individual_call.racionalidadeSaude, sexo: @individual_call.sexo, stGravidezPlanejada: @individual_call.stGravidezPlanejada, tipoAtendimento: @individual_call.tipoAtendimento, turno: @individual_call.turno, vacinaEmDia: @individual_call.vacinaEmDia } }
    end

    assert_redirected_to individual_call_url(IndividualCall.last)
  end

  test "should show individual_call" do
    get individual_call_url(@individual_call)
    assert_response :success
  end

  test "should get edit" do
    get edit_individual_call_url(@individual_call)
    assert_response :success
  end

  test "should update individual_call" do
    patch individual_call_url(@individual_call), params: { individual_call: { CollectiveActivitySheet_id: @individual_call.CollectiveActivitySheet_id, ExamResult_id: @individual_call.ExamResult_id, Exam_id: @individual_call.Exam_id, Forwarding_id: @individual_call.Forwarding_id, Medicine_id: @individual_call.Medicine_id, Participant_id: @individual_call.Participant_id, Professional_id: @individual_call.Professional_id, aleitamentoMaterno: @individual_call.aleitamentoMaterno, alturaAcompanhamentoNutricional: @individual_call.alturaAcompanhamentoNutricional, atencaoDomiciliarModalidade: @individual_call.atencaoDomiciliarModalidade, cnsCidadao: @individual_call.cnsCidadao, condutas: @individual_call.condutas, dataHoraFinalAtendimento: @individual_call.dataHoraFinalAtendimento, dataHoraInicialAtendimento: @individual_call.dataHoraInicialAtendimento, dataNascimento: @individual_call.dataNascimento, dumDaGestante: @individual_call.dumDaGestante, ficouEmObservacao: @individual_call.ficouEmObservacao, idadeGestacional: @individual_call.idadeGestacional, localDeAtendimento: @individual_call.localDeAtendimento, nasfs: @individual_call.nasfs, nuGestasPrevias: @individual_call.nuGestasPrevias, nuPartos: @individual_call.nuPartos, numeroProntuario: @individual_call.numeroProntuario, perimetroCefalico: @individual_call.perimetroCefalico, pesoAcompanhamentoNutricional: @individual_call.pesoAcompanhamentoNutricional, racionalidadeSaude: @individual_call.racionalidadeSaude, sexo: @individual_call.sexo, stGravidezPlanejada: @individual_call.stGravidezPlanejada, tipoAtendimento: @individual_call.tipoAtendimento, turno: @individual_call.turno, vacinaEmDia: @individual_call.vacinaEmDia } }
    assert_redirected_to individual_call_url(@individual_call)
  end

  test "should destroy individual_call" do
    assert_difference('IndividualCall.count', -1) do
      delete individual_call_url(@individual_call)
    end

    assert_redirected_to individual_calls_url
  end
end
