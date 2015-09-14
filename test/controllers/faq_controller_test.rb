require 'test_helper'

class FaqControllerTest < ActionController::TestCase

	def setup
		@request.env['HTTP_REFERER'] = '/admin/faq'
	end

  test "should get index" do
    get :index
    assert_response :success
  end

  # SHOW JSON
  test 'should get a single faq via AJAX request' do
  	get :show, id: faqs(:one).id, :format => :json, xhr: true

  	assert_equal "application/json", @response.content_type
  	assert_response :success
  end

  # CREATE
  test 'should create a new event' do
  	assert_difference('Faq.count') do
    	post :create, faq_question: 'Some question'
  	end
    assert_equal 'Some question', assigns(:faq).question
  	assert_response :redirect
  end

end
