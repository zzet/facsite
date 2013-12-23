require "test_helper"

class Web::GuestBooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    question = create :question

    get :show, id: question.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    attrs = attributes_for :question

    post :create, question: attrs
    assert_response :redirect

    new_question = Question.last
    assert(new_question.title == attrs[:title])
  end

end
