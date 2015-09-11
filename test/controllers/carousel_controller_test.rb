require 'test_helper'

class CarouselControllerTest < ActionController::TestCase
  test "should get show via ajax request" do
    get :show, params: { id: carousels(:one).id }, xhr: true
    assert_equal 'text/javascript', @response.content_type
  end

  test "should update the carousel" do
    put :update
    assert_response :success
  end

end
