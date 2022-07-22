require "application_system_test_case"

class ProblemConditionEvaluatedsTest < ApplicationSystemTestCase
  setup do
    @problem_condition_evaluated = problem_condition_evaluateds(:one)
  end

  test "visiting the index" do
    visit problem_condition_evaluateds_url
    assert_selector "h1", text: "Problem Condition Evaluateds"
  end

  test "creating a Problem condition evaluated" do
    visit problem_condition_evaluateds_url
    click_on "New Problem Condition Evaluated"

    fill_in "Ciaps", with: @problem_condition_evaluated.ciaps
    fill_in "Cid10", with: @problem_condition_evaluated.cid10
    fill_in "Cid10 2", with: @problem_condition_evaluated.cid10_2
    fill_in "Outrociap1", with: @problem_condition_evaluated.outroCiap1
    click_on "Create Problem condition evaluated"

    assert_text "Problem condition evaluated was successfully created"
    click_on "Back"
  end

  test "updating a Problem condition evaluated" do
    visit problem_condition_evaluateds_url
    click_on "Edit", match: :first

    fill_in "Ciaps", with: @problem_condition_evaluated.ciaps
    fill_in "Cid10", with: @problem_condition_evaluated.cid10
    fill_in "Cid10 2", with: @problem_condition_evaluated.cid10_2
    fill_in "Outrociap1", with: @problem_condition_evaluated.outroCiap1
    click_on "Update Problem condition evaluated"

    assert_text "Problem condition evaluated was successfully updated"
    click_on "Back"
  end

  test "destroying a Problem condition evaluated" do
    visit problem_condition_evaluateds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Problem condition evaluated was successfully destroyed"
  end
end
