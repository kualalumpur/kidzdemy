# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    OrderMailer.sample_email(User.first, Order.first)
  end
end
