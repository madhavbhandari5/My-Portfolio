class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      redirect_to login_url
    end
  end

  def require_admin
    unless current_user&.admin?
      redirect_to resumes_path, alert: 'You are not authorized to perform this action.'
    end
  end
end
