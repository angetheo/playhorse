require 'test_helper'

class ServiceControllerTest < ActionController::TestCase
  test "should get show via ajax" do
    get :show, xhr: true
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

end
