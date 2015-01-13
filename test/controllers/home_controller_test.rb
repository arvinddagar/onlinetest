require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get indoex" do
    get :indoex
    assert_response :success
  end

end
