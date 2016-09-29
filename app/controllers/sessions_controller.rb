class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:user][:name])
    auth = user.try(:authenticate, params[:user][:password])
    return head(:forbidden) unless auth
    @user = user
    session[:user_id] = @user.id
    redirect_to welcome_path
  end
end
