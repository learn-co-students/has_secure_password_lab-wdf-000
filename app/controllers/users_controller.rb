class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    @user = User.new(user_params)
     if @user.save
       session[:user_id] = @user.id
       redirect_to welcome_home_path
    else
      flash[:alert] = @user.errors.full_messages[0]
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
