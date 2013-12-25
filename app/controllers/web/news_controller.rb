class Web::NewsController < Web::ApplicationController
  def index
    @top_news = News.web.important.last(2)
    @news = News.web.where.not(id: @top_news).all

    @events = Event.web.all
  end

  def show
    @news = News.find(params[:id])
  end
end
