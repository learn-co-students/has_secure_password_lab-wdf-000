class UsersController < ApplicationController

  before_action :require_login, only: [:welcome]

   def new
     @user = User.new
   end

   def create
     @user = User.create(user_params)

     if @user.save && @user.authenticate(user_params[:password])
       session[:user_id] = @user.id
       redirect_to '/welcome'
     else
       redirect_to '/signup'
     end
   end

   def welcome
     @user = User.find_by(id: session[:user_id])
   end

   private

   def user_params
     params.require(:user).permit(:name, :password, :password_confirmation)
   end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
