class UsersController < ApplicationController

  def create
    @user = User.create(name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    session[:user_id] = @user.id if !@user.id != nil
    redirect_to new_user_path if @user.id == nil
  end

  def new
  end

end
