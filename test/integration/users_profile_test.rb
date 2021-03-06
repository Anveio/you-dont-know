require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  
  def setup
    @user = users(:shovon)
    @other_user = users(:invader)
    @officer = users(:officer)
    @admin = users(:admin)
  end
  
  test "profile display" do
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
  end
  
  test "should redirect profile display when not logged in" do
    get user_path(@user)
    assert_redirected_to login_path
  end
  
  test "should redirect when looking at other users profile" do
    log_in_as(@other_user)
    get user_path(@user)
    assert_redirected_to root_url
  end
  
  test "offcers can view user page" do
    log_in_as(@officer)
    assert @officer.officer?
    get user_path(@user)
    assert_template 'users/show'
  end
  
  test "admins can view user page" do
    log_in_as(@admin)
    assert @admin.admin?
    get user_path(@user)
    assert_template 'users/show'
  end
end
