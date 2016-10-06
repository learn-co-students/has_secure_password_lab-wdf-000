class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'users', action: 'hello'
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
