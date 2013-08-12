class ApplicationController < ActionController::Base
  before_filter :require_login

  protect_from_forgery
  helper_method :current_user

  private
  def current_user
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to log_in_path
    end
  end

  def logged_in?
    !!current_user
  end
end
