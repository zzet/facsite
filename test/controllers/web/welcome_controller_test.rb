require "test_helper"

class Web::WelcomeControllerTest < ActionController::TestCase
  setup do
    10.times { create :news }
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
