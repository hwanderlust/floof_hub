class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :employee?, :require_login, :not_employee, :shelter_employee?
  before_action :logged_in?

  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    current_user.id != nil
  end

  def require_login
    redirect_to login_path unless logged_in?
  end

  def employee?
    !!current_user.shelter_employee
  end

  def shelter_employee?(shelter)
    if employee?
      !!(current_user.employer_id == shelter.id)
    end
  end

  def not_employee
    redirect_to login_path unless employee?
  end

end
