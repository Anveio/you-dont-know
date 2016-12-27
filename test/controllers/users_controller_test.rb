require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:shovon)
    @admin = users(:admin)
    @other_user = users(:invader)
  end
  
  test "should get new" do
    get signup_path
    assert_response :success
  end
  
  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end
  
  test "access page while logged in" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
  end

  test "admin attribute should not be editable via the web" do
    log_in_as(@user)
    assert_not @user.admin?
    patch user_path(@user), params: { user: { password: 'password',
                                              password_confirmation: 'password',
                                              admin: true } }
    assert_not @user.admin?
  end
  
  test "should redirect destroy to log in page when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end
  
  test "should redirect to home page when not admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end
  
  test "successful delete while logged in as admin" do
    log_in_as(@admin)
    assert_difference 'User.count', -1 do
      delete user_path(@other_user)
    end
  end
  
  test "should redirect following when not logged in" do
    get following_user_path(@user)
    assert_redirected_to login_url
  end

  test "should redirect followers when not logged in" do
    get followers_user_path(@user)
    assert_redirected_to login_url
  end
end
