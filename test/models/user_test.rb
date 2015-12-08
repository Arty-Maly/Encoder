require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  def test_user
  	user1 = User.new :email => users(:user1).email,
  					 :password => users(:user1).password,
  					 :password_hash => users(:user1).password_hash

  	assert user1.save

  	user1_cop = User.find(user1.id)

  	assert_equal user1_cop.email, user1.email


    assert user1.destroy
  end
end
