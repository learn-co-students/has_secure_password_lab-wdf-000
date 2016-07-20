class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to '/static/index'
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

  def new
    redirect_to 'static/index'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
