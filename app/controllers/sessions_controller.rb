class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    # return head(:forbidden) unless @user.authenticate(params[:user][:password])
    # session[:user_id] = @user.id
    # redirect_to welcome_home_path
    if @user &&  @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to welcome_home_path
    else
      flash[:message] = "Wrong username and passoword combination!"
      redirect_to login_path
    end
  end

  def destroy
     session.delete(:user_id)
    flash[:message] = "You have successfully logged out."
    redirect_to login_path
  end
end
