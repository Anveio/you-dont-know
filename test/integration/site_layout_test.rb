require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @new_user = users(:applicant)
    @raider = users(:raider)
    @officer = users(:officer)
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    get contact_path
    assert_select "title", full_title("Contact")
    get signup_path
    assert_select "title", full_title("Sign up")
  end
  
  test "navbar_links for logged out users" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", apply_path
    assert_select "a[href=?]", info_path
    assert_select "a[href=?]", applications_path, 0
    assert_select "a[href=?]", users_path, 0
  end
  
  test "navbar links for new users" do
    log_in_as(@new_user)
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", login_path, 0
    assert_select "a[href=?]", applications_path, 0
    assert_select "a[href=?]", users_path, 0
  end
end