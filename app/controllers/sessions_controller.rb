class SessionsController < ApplicationController
  def login
    render :'public/login'
  end

  def create
    case @user = User.find_by(name: user_params[:name])
    when nil
      redirect_to login_path
    when @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_index_path
    else
      render :'public/login', status: 403
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
