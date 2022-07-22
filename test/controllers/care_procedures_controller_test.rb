require "test_helper"

class CareProceduresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @care_procedure = care_procedures(:one)
  end

  test "should get index" do
    get care_procedures_url
    assert_response :success
  end

  test "should get new" do
    get new_care_procedure_url
    assert_response :success
  end

  test "should create care_procedure" do
    assert_difference('CareProcedure.count') do
      post care_procedures_url, params: { care_procedure: { alturaAcompanhamentoNutricional: @care_procedure.alturaAcompanhamentoNutricional, cnsCidadao: @care_procedure.cnsCidadao, dataHoraFinalAtendimento: @care_procedure.dataHoraFinalAtendimento, dataHoraInicialAtendimento: @care_procedure.dataHoraInicialAtendimento, dtNascimento: @care_procedure.dtNascimento, localAtendimento: @care_procedure.localAtendimento, numProntuario: @care_procedure.numProntuario, pesoAcompanhamentoNutricional: @care_procedure.pesoAcompanhamentoNutricional, procedimentos: @care_procedure.procedimentos, sexo: @care_procedure.sexo, statusEscutaInicialOrientacao: @care_procedure.statusEscutaInicialOrientacao, turn: @care_procedure.turn } }
    end

    assert_redirected_to care_procedure_url(CareProcedure.last)
  end

  test "should show care_procedure" do
    get care_procedure_url(@care_procedure)
    assert_response :success
  end

  test "should get edit" do
    get edit_care_procedure_url(@care_procedure)
    assert_response :success
  end

  test "should update care_procedure" do
    patch care_procedure_url(@care_procedure), params: { care_procedure: { alturaAcompanhamentoNutricional: @care_procedure.alturaAcompanhamentoNutricional, cnsCidadao: @care_procedure.cnsCidadao, dataHoraFinalAtendimento: @care_procedure.dataHoraFinalAtendimento, dataHoraInicialAtendimento: @care_procedure.dataHoraInicialAtendimento, dtNascimento: @care_procedure.dtNascimento, localAtendimento: @care_procedure.localAtendimento, numProntuario: @care_procedure.numProntuario, pesoAcompanhamentoNutricional: @care_procedure.pesoAcompanhamentoNutricional, procedimentos: @care_procedure.procedimentos, sexo: @care_procedure.sexo, statusEscutaInicialOrientacao: @care_procedure.statusEscutaInicialOrientacao, turn: @care_procedure.turn } }
    assert_redirected_to care_procedure_url(@care_procedure)
  end

  test "should destroy care_procedure" do
    assert_difference('CareProcedure.count', -1) do
      delete care_procedure_url(@care_procedure)
    end

    assert_redirected_to care_procedures_url
  end
end
