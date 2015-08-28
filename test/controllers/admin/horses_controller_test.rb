require 'test_helper'

class Admin::HorsesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
