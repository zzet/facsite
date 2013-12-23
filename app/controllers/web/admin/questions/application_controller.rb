class Web::Admin::Questions::ApplicationController < Web::Admin::ApplicationController
  before_action :question

  def question
    @question = Question.find(params[:question_id])
  end
end
