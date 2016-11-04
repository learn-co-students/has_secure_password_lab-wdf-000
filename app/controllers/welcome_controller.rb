class WelcomeController < ApplicationController
  before_action :require_login

  def home
    #renders home page
  end

  private
    def require_login
      redirect_to login_path unless session.include? :user_id
    end

end
