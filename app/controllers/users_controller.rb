class UsersController < ApplicationController
    protect_from_forgery with: :exception

    def new
    end

    def create
      if user_params[:password] == user_params[:password_confirmation]
        @user = User.new(user_params)
        @user.save
        session[:user_id] = @user.id
      else
        redirect_to '/users/new'
      end
    end

    private

    def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
