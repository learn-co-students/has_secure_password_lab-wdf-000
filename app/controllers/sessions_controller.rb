class SessionsController < ApplicationController

  def new
    #renders the login form
  end


  def create
    #logs in the user if correct credentials
    @user = User.find_by(name: params[:user][:name])
    authenticated = @user.try(:authenticate, params[:user][:password])
    return redirect_to login_path unless authenticated
    # return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to home_path
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end



end
