class Web::Admin::QuestionsController < Web::Admin::ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end
end
