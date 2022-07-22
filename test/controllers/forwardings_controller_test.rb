require "test_helper"

class ForwardingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forwarding = forwardings(:one)
  end

  test "should get index" do
    get forwardings_url
    assert_response :success
  end

  test "should get new" do
    get new_forwarding_url
    assert_response :success
  end

  test "should create forwarding" do
    assert_difference('Forwarding.count') do
      post forwardings_url, params: { forwarding: { classificacaoRisco: @forwarding.classificacaoRisco, especialidade: @forwarding.especialidade, hipoteseDiagnosticoCid10: @forwarding.hipoteseDiagnosticoCid10 } }
    end

    assert_redirected_to forwarding_url(Forwarding.last)
  end

  test "should show forwarding" do
    get forwarding_url(@forwarding)
    assert_response :success
  end

  test "should get edit" do
    get edit_forwarding_url(@forwarding)
    assert_response :success
  end

  test "should update forwarding" do
    patch forwarding_url(@forwarding), params: { forwarding: { classificacaoRisco: @forwarding.classificacaoRisco, especialidade: @forwarding.especialidade, hipoteseDiagnosticoCid10: @forwarding.hipoteseDiagnosticoCid10 } }
    assert_redirected_to forwarding_url(@forwarding)
  end

  test "should destroy forwarding" do
    assert_difference('Forwarding.count', -1) do
      delete forwarding_url(@forwarding)
    end

    assert_redirected_to forwardings_url
  end
end
