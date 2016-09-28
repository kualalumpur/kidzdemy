class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
    @event = Event.new
    @categories = Category.all
  end

  def create
    @event = Event.new(event_params) # current_user.events.build(event_params)

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
    @categories = Category.all
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
    params.require(:event).permit(:title, :description, :image, :venue, :start, :end, :organizer_name, :organizer_description, :category_id, :user_id)
  end

end
