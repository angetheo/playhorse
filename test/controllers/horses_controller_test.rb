require 'test_helper'

class HorsesControllerTest < ActionController::TestCase

	def setup
		@request.env['HTTP_REFERER'] = '/admin/horses'
	end

  test "should get index" do
    get :index
    assert_response :success
  end

  # SHOW JSON
  test 'should get a single horse info via AJAX request' do
  	get :show, id: horses(:one).id, :format => :json, xhr: true

  	assert_equal "application/json", @response.content_type
  	assert_response :success
  end

  # CREATE
  test 'should create a new horse' do
  	assert_difference('Horse.count') do
    	post :create, horse_name: 'Testhorse'
  	end
    assert_equal 'Testhorse', assigns(:horse).name
  	assert_response :redirect
  end

  # UPDATE
  test 'should update a single horse' do
  	put :update, id: horses(:one).id, edit_horse_name: 'Edithorse'

  	assert_equal 'Edithorse', assigns(:horse).name
    assert_response :redirect
  end

  # DESTROY
  test 'should delete the faq' do
  	assert_difference('Horse.count', -1) do
    	delete :destroy, id: horses(:one).id
  	end
  	assert_response :redirect
  end

end
