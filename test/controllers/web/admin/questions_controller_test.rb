require "test_helper"

class Web::Admin::QuestionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    question = create :question
    get :show, id: question.id
    assert_response :success
  end

end
