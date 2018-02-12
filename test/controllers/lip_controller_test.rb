require 'test_helper'

class LipControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lip_index_url
    assert_response :success
  end

end
