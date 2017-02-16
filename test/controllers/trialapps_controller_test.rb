require 'test_helper'

class TrialappsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @officer = users(:officer)
    @raider = users(:raider)
    @new_applicant = users(:new_applicant)
    @applicant= users(:applicant)
    @outlaw_rogue = trialapps(:outlaw_rogue)
  end
  
  test "should get apply" do
    log_in_as(@applicant)
    get apply_path
    assert_response :success
  end
  
  test "should redirect apply when not logged in" do
    get apply_path
    assert_redirected_to login_path
  end
  
  test "should redirect apply to info page when new applicant" do
    log_in_as(@new_applicant)
    get apply_path
    assert_redirected_to info_path
  end
  
  test "should redirect applications when not logged in" do
    get applications_path
    assert_redirected_to login_url
  end
  
  test "should redirect specific trialapp when not logged in" do
    get trialapp_path(@outlaw_rogue)
    assert_redirected_to login_url
  end
  
  test "users can access their own applications" do
    log_in_as(@applicant)
    get trialapp_path(@applicant.trialapps.first)
  end
  
  test "should redirect applications when not logged in as raider" do
    log_in_as @applicant
    get applications_path
    assert_redirected_to root_url
  end
  
  test "should redirect destroy when logged in as wrong user" do
    log_in_as(@applicant)
    assert_no_difference 'User.count' do
      delete trialapp_path(@outlaw_rogue)
    end
  end
  
  test "officers can view applications" do
    log_in_as(@officer)
    get applications_path
    assert_template 'trialapps/index'
  end
  
  test "officers can view specific applications" do
    log_in_as(@officer)
    get trialapp_path(@outlaw_rogue)
    assert_template 'trialapps/show'
  end
  
  test "raiders can view applications" do
    log_in_as(@raider)
    get applications_path
    assert_template 'trialapps/index'
    get trialapp_path(@outlaw_rogue)
  end
  
  test "raiders can view specific applications" do
    log_in_as(@raider)
    get trialapp_path(@outlaw_rogue)
    assert_template 'trialapps/show'
  end
end
