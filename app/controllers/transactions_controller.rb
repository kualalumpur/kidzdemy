class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def new
    gon.client_token = generate_client_token
    @order = Order.find_by(id: params[:format])
  end

  def create
    @order = Order.find_by(id: params[:format])
    @result = Braintree::Transaction.sale(
              amount: @order.ticket.price,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      @order.status = 1
      @order.save
      flash[:success] = "Congratulations, your transaction has been successful!"
      redirect_to orders_path
    else
      flash[:danger] = @result.errors.full_messages
      gon.client_token = generate_client_token
      render :new
    end
  end


  private
  def generate_client_token
    Braintree::ClientToken.generate
  end
end
