class Web::Admin::Questions::AnswersController < Web::Admin::Questions::ApplicationController
  def show
    @answer = @question.answer
  end

  def new
    answer = @question.build_answer
    @answer = answer.becomes ::Admin::AnswerEditType
  end

  def create
    @answer = ::Admin::AnswerEditType.new(params[:answer])
    if @answer.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def update
    answer = @question.answer
    @answer = answer.becomes ::Admin::AnswerEditType
    if @answer.update(params[:answer])
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @answer = @question.answer
    @answer.destroy
    redirect_to admin_question_path(@question)
  end

  def edit
    answer = @question.answer
    @answer = answer.becomes ::Admin::AnswerEditType
  end
end
