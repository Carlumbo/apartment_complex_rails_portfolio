require 'test_helper'

class FloorPlanControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get floor_plan_index_url
    assert_response :success
  end

  test "should get show" do
    get floor_plan_show_url
    assert_response :success
  end

end
