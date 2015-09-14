require 'test_helper'

class EventsControllerTest < ActionController::TestCase

	def setup
		@request.env['HTTP_REFERER'] = '/admin/events'
	end

  test "should get index" do
    get :index
    assert_response :success
  end

  # SHOW JSON
  test 'should get a single event via AJAX request' do
  	get :show, id: events(:one).id, :format => :json, xhr: true

  	assert_equal "application/json", @response.content_type
  	assert_response :success
  end

  # CREATE
  test 'should create a new event' do
  	assert_difference('Event.count') do
    	post :create, event_name: 'Some name'
  	end
    assert_equal 'Some name', assigns(:event).name
  	assert_response :redirect
  end

  # UPDATE
  test 'should update a single event' do
  	put :update, id: events(:one).id, edit_event_name: 'New name'

  	assert_equal 'New name', assigns(:event).name
    assert_response :redirect
  end

  # DESTROY
  test 'should delete the event' do
  	assert_difference('Event.count', -1) do
    	delete :destroy, id: events(:one).id
  	end
  	assert_response :redirect
  end

end
