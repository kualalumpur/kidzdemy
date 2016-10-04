class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    # @events = Event.where("start >= ?", [DateTime.now]).order('start').page params[:page]
    @events = Event.order("created_at desc").page params[:page]

  end

  def show
    @event = Event.find_by(id: params[:id])
    @comments = Comment.where(event_id: @event.id)
    @comment = Comment.new
  end

  def new
    @event = Event.new
    @categories = Category.all
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "You've created a new event."
      redirect_to new_ticket_path(event_id: @event.id) # events_path
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
    params.require(:event).permit(:title, :description, :image, :address, :start, :end, :organizer_name, :organizer_description, :category_id, :user_id)
  end

end
