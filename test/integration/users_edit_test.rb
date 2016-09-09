require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:shovon)
    @other_user = users(:invader)
  end
  
  test "successful log_in as other user" do
    log_in_as(@other_user)
    get edit_user_path(@other_user)
    assert_template 'users/edit'
  end
  
  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: {name: "", email: "user@invalid", 
                                            password: "foo", password_confirmation: "bar" } }
    assert_template 'users/edit'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end
  
  
  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    new_name = "Foo Bar"
    new_email = "foo@bar.com"
    patch user_path(@user), params: { user: {name: new_name, email: new_email,
                                            password: "", password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal new_name, @user.name
    assert_equal new_email, @user.email
  end
  
  test "should redirect when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect update when not logged in" do
    get edit_user_path(@user)
    new_email = "foo@bar.com"
    new_name = "Foo Bar"
    patch user_path(@user), params: { user: {name: new_name, email: new_email,
                                            password: "", password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    new_email = "foo@bar.com"
    new_name = "Foo Bar"
    patch user_path(@user), params: { user: {name: new_name, email: new_email,
                                            password: "", password_confirmation: "" } }
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name:  name,
                                      email: email,
                                      password:              "",
                                      password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
