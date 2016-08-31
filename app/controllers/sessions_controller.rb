class SessionsController < ApplicationController
  def new
  end

  def create

    @user = User.find_by(name: params[:user][:name])
    # byebug
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
    end

    redirect_to '/'
  end

  def destroy
  end
end
