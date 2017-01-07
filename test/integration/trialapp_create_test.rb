require 'test_helper'

class TrialappCreateTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:applicant)
  end
  
  test "should redirect when not logged in" do
    get apply_path
    assert_redirected_to login_path
  end
  
  test "invalid trialapp information" do
    log_in_as(@user)
    get apply_path
    assert_template 'trialapps/new'
    assert_no_difference 'Trialapp.count' do
      post apply_path, params: { trialapp: { character_name: "", server: "Thrall",
                                 character_class: "Rogue", spec: "Outlaw" } }
    end
    assert_template 'trialapps/new'
  end
  
  test "valid trialapp information" do
    log_in_as(@user)
    get apply_path
    assert_template 'trialapps/new'
    assert_difference 'Trialapp.count', 1 do
      post apply_path, params: { trialapp: { character_name: "Anveio", server: "Thrall",
                                 character_class: "Rogue", spec: "Outlaw" } }
    assert_redirected_to questions_path
    end
  end
end
