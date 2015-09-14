require 'test_helper'

class CommunicationsControllerTest < ActionController::TestCase
  
  # UPDATE AJAX - JSON RESPONSE
  test 'should update the communication via ajax' do
  	put :update, id: communications(:one).id, format: :json, xhr: true, t: 'eventi', edit_communication: 'nuova comunicazione'

  	assert_equal 'nuova comunicazione', assigns(:communication).content
  	assert_equal "application/json", @response.content_type
  	assert_response :success
  end

end
