require 'test_helper'

class ServiceControllerTest < ActionController::TestCase

	def setup
		@request.env['HTTP_REFERER'] = '/admin'
	end

  # SHOW JSON
  test 'should get a single service info via AJAX request' do
  	get :show, id: services(:one).id, :format => :json, xhr: true

  	assert_equal "application/json", @response.content_type
  	assert_response :success
  end

  # UPDATE
  test 'should update a single service' do
  	put :update, id: services(:one).id, edit_service_title: 'new service', :format => :json, xhr: true

  	assert_equal 'new service', assigns(:service).title
    assert_response :success
  end

end
