class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.try(:authenticate, params[:user][:password])
      if @user.id != nil
        session[:user_id] = User.last.id
      else
        redirect_to(controller: 'users', action: 'new')
      end
    end
  end

  def new
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
