class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  
  def require_login
    redirect_to login_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    session[:user_id]
  end
end
