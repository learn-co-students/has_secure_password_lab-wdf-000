class User < ActiveRecord::Base
  has_secure_password

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
