require 'test_helper'

class PasswordsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #Pedir cambio de contraseña
  test "pedir cambio" do
      post passwords_forgot_path(:email), as: :json
      assert_response :success
  end
   
  test "change" do
      post passwords_reset_path(:email,:token), as: :json
      assert_response :success
  end

  #contraseña nueva
  test "update password" do
    put passwords_update_path((:password,:token)), as: :json
    assert_response :success
  end
  
end
