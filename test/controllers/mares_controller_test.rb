require 'test_helper'

class MaresControllerTest < ActionController::TestCase

	def setup
		@request.env['HTTP_REFERER'] = '/admin/mares'
	end

  test "should get index" do
    get :index
    assert_response :success
  end

  # SHOW JSON
  test 'should get a single mare info via AJAX request' do
  	get :show, id: mares(:one).id, :format => :json, xhr: true

  	assert_equal "application/json", @response.content_type
  	assert_response :success
  end

  # CREATE
  test 'should create a new mare' do
  	assert_difference('Mare.count') do
    	post :create, mare_name: 'Mare'
  	end
    assert_equal 'Mare', assigns(:mare).name
  	assert_response :redirect
  end

  # UPDATE
  test 'should update a single mare' do
  	put :update, id: mares(:one).id, edit_mare_name: 'Edit mare'

  	assert_equal 'Edit mare', assigns(:mare).name
    assert_response :redirect
  end

  # DESTROY
  test 'should delete the faq' do
  	assert_difference('Mare.count', -1) do
    	delete :destroy, id: mares(:one).id
  	end
  	assert_response :redirect
  end

end
