class UsersController < ApplicationController
  def new
  end

  def create
    if params[:user][:name] && params[:user][:password] && params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(
        name: params[:user][:name],
        password: params[:user][:password]
      )
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/new'
    end
    
  end


  def home
    if session[:user_id].nil? || session[:user_id].empty?
      redirect_to '/new'
    end
    @user = User.find_by(id: session[:user_id])
  end

  def confirm(param)
    !param.nil? && !params.empty?
  end

end
