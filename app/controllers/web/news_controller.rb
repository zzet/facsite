class Web::NewsController < Web::ApplicationController
  def index
    @top_news = News.web.last(2)
    @news = News.web.offset(2).all
  end

  def show
    @news = News.find(params[:id])
  end
end
