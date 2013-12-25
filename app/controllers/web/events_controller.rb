class Web::EventsController < Web::ApplicationController
  def index
    @top_event = Event.web.last(2)
    @events = Event.web.offset(2).all

    @news = News.web.last(4).all
  end

  def show
    @event = Event.find(params[:id])
  end
end
