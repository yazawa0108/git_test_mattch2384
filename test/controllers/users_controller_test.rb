require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:nicky)
  end

  test "should create new account" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post user_registration_path, params: { user: {last_name: "西川",
                                            first_name: "英一",
                                            email: "example@example.com",
                                            password: "foobar",
                                            password_confirmation: "foobar"}}
    end
  end
end
