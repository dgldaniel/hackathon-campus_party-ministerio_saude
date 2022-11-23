require "test_helper"

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get individual_registrations" do
    get search_individual_registrations_url
    assert_response :success
  end
end
