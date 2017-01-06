require 'test_helper'

class TrialappTest < ActiveSupport::TestCase
  def setup
    @user = users(:applicant)
    @trialapp = @user.trialapps.build(character_name: "Anveio", server: "Thrall",
                                      character_class: "Rogue", spec: "Outlaw")
  end
  
  test "should be valid" do
    assert @trialapp.valid?
  end
  
  test "user id should be present" do
    @trialapp.user_id = nil
    assert_not @trialapp.valid?
  end
  
  test "character name should be present" do
    @trialapp.character_name = nil
    assert_not @trialapp.valid?
  end
  
  test "server should be present" do
    @trialapp.server = nil
    assert_not @trialapp.valid?
  end
  
  test "character class name should be present" do
    @trialapp.character_class = nil
    assert_not @trialapp.valid?
  end
  
  test "spec should be present" do
    @trialapp.spec = nil
    assert_not @trialapp.valid?
  end
  
end
