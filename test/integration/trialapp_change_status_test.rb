require 'test_helper'

class TrialappChangeStatusTest < ActionDispatch::IntegrationTest
  def setup
    @officer = users(:shovon)
    @raider = users(:raider)
    @new_applicant = users(:new_applicant)
    @applicant= users(:applicant)
    @outlaw_rogue = trialapps(:outlaw_rogue)
  end
  
  test "should redirect accept when raider" do
    log_in_as @raider
  end
end
