class OrderMailer < ApplicationMailer
  default :from => 'noreply@kidzdemy.com'


  def sample_email(user, order)
    @user = user
    @order = order
    mail( :to => @user.email,
    :subject => 'Ticket Booking Confirmation' )
  end

end
