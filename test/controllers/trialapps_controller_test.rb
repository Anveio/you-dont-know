require 'test_helper'

class TrialappsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:applicant)
  end
  
  test "should get apply" do
    log_in_as(@user)
    get apply_path
    assert_response :success
  end
end
