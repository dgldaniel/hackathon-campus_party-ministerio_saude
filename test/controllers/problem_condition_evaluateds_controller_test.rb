require "test_helper"

class ProblemConditionEvaluatedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @problem_condition_evaluated = problem_condition_evaluateds(:one)
  end

  test "should get index" do
    get problem_condition_evaluateds_url
    assert_response :success
  end

  test "should get new" do
    get new_problem_condition_evaluated_url
    assert_response :success
  end

  test "should create problem_condition_evaluated" do
    assert_difference('ProblemConditionEvaluated.count') do
      post problem_condition_evaluateds_url, params: { problem_condition_evaluated: { ciaps: @problem_condition_evaluated.ciaps, cid10: @problem_condition_evaluated.cid10, cid10_2: @problem_condition_evaluated.cid10_2, outroCiap1: @problem_condition_evaluated.outroCiap1 } }
    end

    assert_redirected_to problem_condition_evaluated_url(ProblemConditionEvaluated.last)
  end

  test "should show problem_condition_evaluated" do
    get problem_condition_evaluated_url(@problem_condition_evaluated)
    assert_response :success
  end

  test "should get edit" do
    get edit_problem_condition_evaluated_url(@problem_condition_evaluated)
    assert_response :success
  end

  test "should update problem_condition_evaluated" do
    patch problem_condition_evaluated_url(@problem_condition_evaluated), params: { problem_condition_evaluated: { ciaps: @problem_condition_evaluated.ciaps, cid10: @problem_condition_evaluated.cid10, cid10_2: @problem_condition_evaluated.cid10_2, outroCiap1: @problem_condition_evaluated.outroCiap1 } }
    assert_redirected_to problem_condition_evaluated_url(@problem_condition_evaluated)
  end

  test "should destroy problem_condition_evaluated" do
    assert_difference('ProblemConditionEvaluated.count', -1) do
      delete problem_condition_evaluated_url(@problem_condition_evaluated)
    end

    assert_redirected_to problem_condition_evaluateds_url
  end
end
