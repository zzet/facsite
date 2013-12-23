require "test_helper"

class Web::Admin::Questions::AnswersControllerTest < ActionController::TestCase
  setup do
    @question = create :question
    @param = { question_id: @question.id }
  end

  test "should get show" do
    create :answer, question: @question
    get :show, @param
    assert_response :success
  end

  test "should get new" do
    get :new, @param
    assert_response :success
  end

  test "should get create" do
    attrs = attributes_for(:answer, question_id: @question.id)
    post :create, @param.merge({ answer: attrs })
    assert_response :redirect

    new_answer = Answer.last
    assert(new_answer.title == attrs[:title])
    assert(new_answer.question == @question)
  end

  test "should get update" do
    answer = create :answer, question: @question
    attrs = attributes_for :answer, question: @question

    put :update, @param.merge({ answer: attrs })
    assert_response :redirect

    answer.reload
    assert(answer.title == attrs[:title])
  end

  test "should get destroy" do
    answer = create :answer, question: @question
    delete :destroy, @param
    assert_response :redirect

    removed_answer = Answer.find_by(id: answer.id)
    assert(removed_answer == nil)
  end

  test "should get edit" do
    create :answer, question: @question
    get :edit, @param
    assert_response :success
  end

end
