class UsersController < ApplicationController

  def create
    @user = User.new(users_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to new_user_path
  end

  def users_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
