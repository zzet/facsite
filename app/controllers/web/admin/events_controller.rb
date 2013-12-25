class Web::Admin::EventsController < Web::Admin::ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = ::Admin::EventEditType.new
  end

  def create
    @event = ::Admin::EventEditType.new(params[:event])
    if @event.save
      redirect_to admin_event_path(@event.id)
    else
      render :new
    end
  end

  def edit
    event = Event.find(params[:id])
    @event = event.becomes ::Admin::EventEditType
  end

  def update
    event = Event.find(params[:id])
    @event = event.becomes ::Admin::EventEditType
    if @event.update(params[:event])
      #      f(:success)
      redirect_to admin_events_path
    else
      #      f(:error)
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_events_path
  end

  def show
    @event = Event.find(params[:id])
  end
end
