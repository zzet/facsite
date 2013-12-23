class Web::GuestBooksController < Web::ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = QuestionEditType.new
  end

  def create
    @question = QuestionEditType.new(params[:question])
    if @question.save
      redirect_to guest_books_path
    else
      render :new
    end
  end
end
