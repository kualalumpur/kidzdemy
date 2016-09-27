class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @categories = Category.all
    if @event.save
      flash[:success] = "You've created a new event."
      redirect_to events_path
    else
      flash[:danger] = @event.errors.full_messages
      redirect_to new_event_path
    end
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])

    if @event.update(event_params)
      flash[:success] = "You've updated the event."
      redirect_to event_path(@event)
    else
      flash[:danger] = @event.errors.full_messages
      redirect_to edit_event_path(@event)
    end
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    if @event.destroy
      flash[:success] = "You've deleted the event."
      redirect_to events_path
    else
      flash[:danger] = @event.errors.full_messages
      redirect_to event_path(@event)
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :datetime, :image, :venue, :type)
  end

end
