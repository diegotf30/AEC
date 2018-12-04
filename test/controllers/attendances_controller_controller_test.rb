require 'test_helper'

class AttendancesControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get attendances_controller_create_url
    assert_response :success
  end

  test "should get new" do
    get attendances_controller_new_url
    assert_response :success
  end

end
