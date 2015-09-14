require 'test_helper'

class Admin::MaresControllerTest < ActionController::TestCase
  
	def setup
		session[:user] = 'test_user'
	end

  test "should get index" do
    get :index
    assert_response :success
  end

end
