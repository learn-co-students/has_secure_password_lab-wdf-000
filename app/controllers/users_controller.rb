class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    redirect_to new_user_path and return unless @user.password_confirmation == @user.password
    session[:user_id] = @user.id
    redirect_to welcome_path
  end

  def welcome
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
