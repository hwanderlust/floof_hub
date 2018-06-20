class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?
    current_user.id != nil
  end
  def require_login
    redirect_to login_path unless logged_in?
  end
end
