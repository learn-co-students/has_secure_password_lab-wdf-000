class SessionsController < ApplicationController
  def new
  end
  
  def create
   @user = User.find_by(name: params[:user][:name])
   if @user.authenticate(params[:user][:password])
     session[:user_id] = @user.id
     redirect_to '/welcome'
   else
     flash[:message] = "Password or username does not match! :o No soup for you!"
     redirect_to '/login'
   end
 end

  def destroy
    session[:user_id] = nil unless session[:user_id].nil?
    flash[:message] = "You have been succesfully logged out."
    redirect_to '/login'
  end
end
