class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def welcome
  end

  private
    def valid_fields?
      params[:user][:password] == params[:user][:password_confirmation] && !params[:user][:password].nil? && !params[:user][:password].empty?    
    end
end
