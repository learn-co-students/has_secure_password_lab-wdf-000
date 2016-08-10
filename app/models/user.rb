class User < ActiveRecord::Base

  has_secure_password
  validate :password_match

  def password_match
    if password_confirmation && password != password_confirmation
      errors.add(:password_confirmation, "password confirmation doesn't match")
    end
  end



end
