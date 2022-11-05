require "test_helper"

class IndividualCallMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @individual_call_master = individual_call_masters(:one)
  end

  test "should get index" do
    get individual_call_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_individual_call_master_url
    assert_response :success
  end

  test "should create individual_call_master" do
    assert_difference('IndividualCallMaster.count') do
      post individual_call_masters_url, params: { individual_call_master: { tpCdsOrigem: @individual_call_master.tpCdsOrigem, uuid: @individual_call_master.uuid } }
    end

    assert_redirected_to individual_call_master_url(IndividualCallMaster.last)
  end

  test "should show individual_call_master" do
    get individual_call_master_url(@individual_call_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_individual_call_master_url(@individual_call_master)
    assert_response :success
  end

  test "should update individual_call_master" do
    patch individual_call_master_url(@individual_call_master), params: { individual_call_master: { tpCdsOrigem: @individual_call_master.tpCdsOrigem, uuid: @individual_call_master.uuid } }
    assert_redirected_to individual_call_master_url(@individual_call_master)
  end

  test "should destroy individual_call_master" do
    assert_difference('IndividualCallMaster.count', -1) do
      delete individual_call_master_url(@individual_call_master)
    end

    assert_redirected_to individual_call_masters_url
  end
end
