class UsersController < ApplicationController
  before_action :authentication_required, only: [:user_index]
  # skip_before_action :authentication_required, only: [:new]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_index_path
    else
      redirect_to new_path
    end
  end

  def user_index
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
