class UsersController < ApplicationController
  def new
  end

  def create
    if user = User.new(user_params).save
    # binding.pry
      session[:user_id] = User.last.id
      redirect_to sessions_new_path
    else
      redirect_to users_new_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
