require 'test_helper'

class CarouselControllerTest < ActionController::TestCase

	# SETUP
	def setup
		@request.env['HTTP_REFERER'] = '/admin/home'
	end
  
  # SHOW JSON
  test 'should get a single element via AJAX request' do
  	get :show, id: carousels(:one).id, :format => :json, xhr: true

  	assert_response :success
  	assert_equal "application/json", @response.content_type
  end

  # UPDATE
  test 'should update a single element' do
    put :update, id: carousels(:one).id, edit_carousel_title: 'different title'

    assert_equal 'different title', assigns(:carousel).title
    assert_response :redirect
  end

end
