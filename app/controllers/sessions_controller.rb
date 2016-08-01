class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to controller: 'application', action: 'welcome'
    else
      redirect_to controller: 'users', action: 'new'
    end
  end
end
