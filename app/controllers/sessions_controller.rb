class SessionsController < ApplicationController

  def login
    render :'public/login'
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to user_index_path
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end
