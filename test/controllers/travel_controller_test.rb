require 'test_helper'

class TravelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get travel_index_url
    assert_response :success
  end

  test "should get search" do
    get travel_search_url
    assert_response :success
  end

end
