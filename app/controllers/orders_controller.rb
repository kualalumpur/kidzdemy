class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @event = Event.find_by(id: params[:id])
    @tickets = Ticket.where(event_id: params[:id])
    @orders = Order.where('ticket_id IN (?)', @tickets.ids)
  end

  def new
    @ticket = Ticket.find_by(id: params[:format])
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      if @order.ticket.price <= 0.0
        flash[:success] = "You've registered a new ticket."
        redirect_to orders_path
      else
        redirect_to new_transaction_path(@order)
      end
    else
      flash[:danger] = @order.errors.full_messages
      redirect_to new_order_path
    end
  end

  def edit
    @order = Order.find_by(id: params[:id])
    @categories = Category.all
  end

  def update
    @order = Order.find_by(id: params[:id])

    if @order.update(order_params)
      flash[:success] = "You've updated the order."
      redirect_to order_path(@order)
    else
      flash[:danger] = @order.errors.full_messages
      redirect_to edit_order_path(@order)
    end
  end

  def destroy
    @order = Order.find_by(id: params[:id])
    if @order.destroy
      flash[:success] = "You've deleted the order."
      redirect_to orders_path
    else
      flash[:danger] = @order.errors.full_messages
      redirect_to order_path(@order)
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :user_id, :ticket_id, :status)
  end

end
