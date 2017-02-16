require 'test_helper'

class TrialappCreateTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:applicant)
    @trialapp = trialapps(:outlaw_rogue)
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
  
  test "full application process" do
    log_in_as(@user)
    get apply_path
    assert_template 'trialapps/new'
    assert_difference 'Trialapp.count', 1 do
      post apply_path, params: { trialapp: { character_name: "Anveio", server: "Thrall",
                                 character_class: "Rogue", spec: "Outlaw" } }
    assert_redirected_to questions_path
    end
    follow_redirect!
    assert_template 'trialapps/questions'
    post edit_trialapp_path(@user.trialapps.first), params: { trialapp: { answer_one: "Answer 1", 
                                  answer_two: "Answer 2", answer_three: "Answer 3", 
                                  answer_four: "Answer 4" } }
    assert_equal @trialapp, @user.trialapps.first
  end
end
