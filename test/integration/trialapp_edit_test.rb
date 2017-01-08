require 'test_helper'

class TrialappEditTestTest < ActionDispatch::IntegrationTest
  def setup
    @applicant= users(:applicant)
    @applicant.trialapps.build(character_name: "Anveio", server: "Thrall", 
                                character_class: "Rogue", spec: "Outlaw")
  end
  
  test "successful edit" do
    log_in_as(@applicant)
    get edit_trialapp_path(@applicant.trialapps.first.id)
    assert_template 'trialapps/edit'
  end
end
