class SessionsController < ApplicationController
  def create
    # binding.pry
    if params[:user][:name].nil? && param[:user][:name].empty? && params[:user][:password].nil? && params[:user][:password].empty?
      redirect_to root_path
    else
      @user = User.find_by(name:params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to root_path
      end
    end
  end
end
