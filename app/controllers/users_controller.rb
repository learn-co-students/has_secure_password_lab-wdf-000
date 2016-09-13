class UsersController < ApplicationController
  before_action :require_login, only: :welcome

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.errors.empty?
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      flash[:alert] = @user.errors.full_messages[0]
      redirect_to '/signup'
    end
  end

  def welcome
    @user = User.find_by_id(session[:user_id])
    render 'welcome'
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def require_login
    redirect_to '/login' unless session.include? :user_id
  end
end
