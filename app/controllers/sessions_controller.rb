class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to controller: 'welcome', action: 'home'
    else
        redirect_to(controller: 'sessions', action: 'new')
    end
  end

  def new
  end

  def destroy
    if session[:name] != nil
      session.clear
    end
  end
end
