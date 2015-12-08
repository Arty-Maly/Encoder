require 'test_helper'

class MainControllerTest < ActionController::TestCase
	  fixtures :users, :messages
	  def setup
	  	@controller = MainController.new
	  	@request    = ActionController::TestRequest.new
	    @response   = ActionController::TestResponse.new
	  end


	  def test_encryption
	  	xhr :get, :ceaser_encrypt, :string => 'A', :offset => "1"
	  	assert_response :success
	  end

	def json_response
	    ActiveSupport::JSON.decode @response.body
	end
end
