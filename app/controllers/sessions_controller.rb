class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    authenticated = @user.try(:authenticate, params[:user][:password])
    if authenticated
      session[:user_id] = authenticated.id
      redirect_to '/'
    else
      redirect_to 'login'
    end
  end

  def destroy
    session.delete :user_id
  end
end
