require 'test_helper'

class SubscribersControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :redirect
  end

end
