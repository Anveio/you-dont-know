require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:shovon)
    @admin = users(:admin)
    @other_user = users(:invader)
  end
  
  test "should redirect index when viewing as non officer" do
    log_in_as(@other_user)
    get users_path
    assert_redirected_to root_url
  end
  
  test "officers can view users index" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
  end
  
  test "index including pagination" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    #assert_select 'div.pagination', count: 2
    User.paginate(page: 1).each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
  end
  
  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    #assert_select 'div.pagination', count: 2
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'delete'
      end
    end
    
    assert_difference 'User.count', -1 do
      delete user_path(@other_user)
    end
  end
end
