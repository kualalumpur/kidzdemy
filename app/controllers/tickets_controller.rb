class TicketsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @tickets = Ticket.where(event_id: params[:event_id])
    @event = Event.find_by(id: params[:event_id])
  end

  def show
    @ticket = Ticket.find_by(id: params[:id])
  end

  def new
    @event = Event.find_by(id: params[:event_id])
    @ticket = Ticket.new
  end

  def create
    @event = Event.find_by(id: params[:format])

    if params[:ticket][:ttype] == "paid" && params[:ticket][:price].to_f <= 0
      flash[:danger] = "You cannot create paid ticket without specifying a price."
      redirect_to new_ticket_path(event_id: @event.id) and return
    end

    @ticket = @event.tickets.build(ticket_params) # Ticket.new(ticket_params)

    if @ticket.save
      flash[:success] = "You've created a new ticket."
      redirect_to tickets_path(event_id: @event.id)
    else
      flash[:danger] = @ticket.errors.full_messages
      redirect_to new_ticket_path
    end
  end

  def edit
    @ticket = Ticket.find_by(id: params[:id])
    authorize! :edit, @ticket
  end

  def update
    @ticket = Ticket.find_by(id: params[:id])
    authorize! :update, @ticket
    if params[:ticket][:ttype] == "paid" && params[:ticket][:price].to_f <= 0
      flash[:danger] = "You cannot create paid ticket without specifying a price."
      redirect_to edit_ticket_path(@ticket) and return
    end

    if @ticket.update(ticket_params)
      flash[:success] = "You've updated the ticket."
      redirect_to tickets_path(event_id: @ticket.event_id)
    else
      flash[:danger] = @ticket.errors.full_messages
      redirect_to edit_ticket_path(@ticket)
    end
  end

  def destroy
    @ticket = Ticket.find_by(id: params[:id])
    authorize! :destroy, @ticket
    if @ticket.destroy
      flash[:success] = "You've deleted the ticket."
      redirect_to tickets_path(event_id: @ticket.event_id)
    else
      flash[:danger] = @ticket.errors.full_messages
      redirect_to ticket_path(@ticket)
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :ttype, :quantity, :price, :event_id)
  end

end
