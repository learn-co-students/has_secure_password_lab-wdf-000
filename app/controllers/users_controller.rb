class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user && @user.authenticate(params[:user][:password_confirmation])
      session[:user_id] = @user.id
      redirect_to welcomes_path
    else
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
