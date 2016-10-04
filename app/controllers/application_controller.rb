class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    flash[:danger] = "You're not authorized."
    redirect_to request.referrer || '/'
  end
end
