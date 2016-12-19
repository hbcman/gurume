require 'test_helper'

class TokusyusControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
