class UsersController < ApplicationController


  def new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]  #the password_confirmation field is used to
        user = User.create(verified_user)                               #require a user to type in their password twice. this is
        session[:user_id] = user.id                                       #used for security purposes. we then create a user with the
    else                                                                 #params provided and set the session to the user.id.
      redirect_to new_user_path                                         #else we redirect the user to the new page
    end
  end










  private

  def verified_user
    params.require(:user).permit(:name, :password, :password_confirmation)
  end













end
