require 'test_helper'

class TrialappEditTestTest < ActionDispatch::IntegrationTest
  def setup
    @applicant= users(:applicant)
  end
  
  test "successful edit" do
    log_in_as(@applicant)
    get edit_trialapp_path(@applicant.trialapps.first)
    assert_template 'trialapps/edit'
  end
end
