class Web::Admin::NewsController < Web::Admin::ApplicationController
  def index
    @news = News.scoped
  end

  def new
    @news = ::Admin::NewsEditType.new
  end

  def create
    @news = ::Admin::NewsEditType.new(params[:news])
    redirect_to admin_news_path(@news)
  end

  def edit
    news = News.find(params[:id])
    @news = news.becomes ::Admin::NewsEditType
  end

  def update
    news = News.find(params[:id])
    @news = news.becames ::Admin::NewsEditType
    if @news.update(params[:news])
      #      f(:success)
      redirect_to edit_admin_news_path(@news)
    else
      #      f(:error)
      render :edit
    end
  end

  def destroy
    @news.destroy
    redirect_to admin_news_index_path
  end

  def show
    @news = News.find(params[:id])
  end
end
