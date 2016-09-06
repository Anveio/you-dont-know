require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:shovon)
  end
  
  # test "unsuccessful edit" do
  #   log_in_as(@user)
  #   get edit_user_path(@user)
  #   assert_template 'users/edit'
  #   patch user_path(@user), params: { user: {name: "", email: "user@invalid", 
  #                                           password: "foo", password_confirmation: "bar" } }
  #   assert_template 'users/edit'
  #   assert_select 'div#error_explanation'
  #   assert_select 'div.field_with_errors'
  # end
  
  
  # test "successful edit" do
  #   log_in_as(@user)
  #   get edit_user_path(@user)
  #   assert_template 'users/edit'
  #   new_name = "Foo Bar"
  #   new_email = "foo@bar.com"
  #   patch user_path(@user), params: { user: {name: new_name, email: new_email,
  #                                           password: "", password_confirmation: "" } }
  #   assert_not flash.empty?
  #   assert_redirected_to @user
  #   @user.reload
  #   assert_equal new_name, @user.name
  #   assert_equal new_email, @user.email
  # end
end
