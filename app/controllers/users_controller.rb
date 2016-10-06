class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if user_params[:password] == user_params[:password_confirmation]
      @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'users', action: 'hello'
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

  def hello
    return @user = User.find_by(id: session[:user_id]) if session[:user_id]
    redirect_to controller: 'sessions', action: 'create'
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
