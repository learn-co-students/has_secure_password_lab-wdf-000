class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to :login
    else
      redirect_to :new_session
    end
  end
  
  def sessions_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
