class SessionsController < ApplicationController
  def new
  end

  def create
    case @user = User.find_by(name: user_params[:name])
    when nil
      redirect_to login_path, alert: 'No records found'
    when @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_index_path
    else
      flash.now[:error] = 'Access Denied'
      render :'sessions/new', status: 403
      # redirect_to login_path, status: 403, error: 'Access Denied'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path, alert: 'You have logged out'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
