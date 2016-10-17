class SessionsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def new
  end

  def create

      @user = User.find_by(name: params[:user][:name])
        # binding.pry
      if @user != nil || @user != ""
        if params[:user][:password] == '' || params[:user][:password] == nil
          redirect_to '/new'
        else
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      end
      else
        redirect_to '/new'
      end
    end

end
