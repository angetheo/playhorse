require 'test_helper'

class StaffControllerTest < ActionController::TestCase

	def setup
		@request.env['HTTP_REFERER'] = '/admin/staff'
	end

  test "should get index" do
    get :index
    assert_response :success
  end

  # SHOW JSON
  test 'should get a single member info via AJAX request' do
  	get :show, id: staffs(:one).id, :format => :json, xhr: true

  	assert_equal "application/json", @response.content_type
  	assert_response :success
  end

  # CREATE
  test 'should create a new staff member' do
  	assert_difference('Staff.count') do
    	post :create, staff_name: 'Test Doge'
  	end
    assert_equal 'Test Doge', assigns(:staff).name
  	assert_response :redirect
  end

  # UPDATE
  test 'should update a single member info' do
  	put :update, id: staffs(:one).id, edit_staff_name: 'Edit Doge'

  	assert_equal 'Edit Doge', assigns(:staff).name
    assert_response :redirect
  end

  # DESTROY
  test 'should delete the staff' do
  	assert_difference('Staff.count', -1) do
    	delete :destroy, id: staffs(:one).id
  	end
  	assert_response :redirect
  end

end
