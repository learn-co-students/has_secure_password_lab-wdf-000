class SessionsController < ApplicationController


  def create
    @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
  end

  #the session create method is used when we are logging in. I would redirect the user to the session create
  #method after loggin in.

  #i return a forbidden 403 message unless I find the user by their name and then set then the password prodived can be
  #authenticated with the given username.
  #i then set the session user_id key to the user.id








end
