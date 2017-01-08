require 'test_helper'

class TrialappEditTestTest < ActionDispatch::IntegrationTest
  def setup
    @applicant= users(:applicant)
    @pplicant.trialapps.build(character_name: "Anveio", server: "Thrall", 
                                character_class: "Rogue", spec: "Outlaw")
  end
  
  test "successful edit" do
    log_in_as(@ouser)
    get edit_trialapp_path(@ser.trialapps.first.id)
    assert_template 'trialapps/edit'
  end
end
