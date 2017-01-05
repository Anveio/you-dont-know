require 'test_helper'

class TrialappTest < ActiveSupport::TestCase
  def setup
    @user = users(:applicant)
    @trialapp = Trialapp.new(user_id: @user.id)
  end
  
  test "should be valid" do
    assert @trialapp.valid?
  end
  
  test "should require a user_id" do
    @trialapp.user_id = nil
    assert_not @trialapp.valid?
  end
end
