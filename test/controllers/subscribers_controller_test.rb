require 'test_helper'

class SubscribersControllerTest < ActionController::TestCase

  test "should add a new subscriber" do
  	assert_difference('Subscriber.count') do
    	post :create, subscriber_email: 'example@doge.it'
    end

    assert_equal "Iscrizione alla newsletter effettuata correttamente!", flash[:notice]
    assert_response :redirect
  end

end
