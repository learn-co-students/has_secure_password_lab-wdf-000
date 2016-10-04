class WelcomeController < ApplicationController
  before_action :login_required, only: :home

  def home
    @user = User.find_by_id(session[:user_id])
  end

  private

  def login_required
    redirect_to login_path unless session.include? :user_id
  end
end
