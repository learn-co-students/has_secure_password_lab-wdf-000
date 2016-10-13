class UsersController < ApplicationController


  def new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      user = User.new(verified_user)
      if user
        user = User.create(verified_user)
        session[:user_id] = user.id
      end
    else
      redirect_to new_user_path
    end
  end










  private

  def verified_user
    params.require(:user).permit(:name, :password, :password_confirmation)
  end













end
