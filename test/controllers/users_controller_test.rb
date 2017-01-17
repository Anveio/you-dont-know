require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:shovon)
    @admin = users(:admin)
    @other_user = users(:invader)
    @trialapp = trialapps(:outlaw_rogue)
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
    get user_path(@user)
    assert_template 'users/show'
  end

  test "admin attribute should not be editable via the web" do
    log_in_as(@user)
    assert_not @user.admin?
    patch user_path(@user), params: { user: { password: 'password',
                                              password_confirmation: 'password',
                                              admin: true } }
    assert_not @user.admin?
  end
  
  test "raider attribute should not be editable via the web" do
    log_in_as(@user)
    assert_not @user.raider?
    patch user_path(@user), params: { user: { password: 'password',
                                              password_confirmation: 'password',
                                              raider: true } }
    assert_not @user.raider?
  end
  
  test "officer attribute should not be editable via the web" do
    log_in_as(@other_user)
    assert_not @other_user.officer?
    patch user_path(@other_user), params: { user: { password: 'password',
                                              password_confirmation: 'password',
                                              raider: true } }
    assert_not @other_user.raider?
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
  
  test "should not show checkbox if user has already agreed" do
    log_in_as(@user)
    get info_path
    assert_template 'users/info'
  end
  
  test "officers can view applications" do
    log_in_as(@user)
    get trialapps_path(@trialapp)
    assert_template 'trialapps/index'
  end
end
