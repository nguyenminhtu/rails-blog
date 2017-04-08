class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :require_admin

  def current_user
  	@current_user ||= User.find(session[:uid]) if session[:uid]
  end

  def logged_in?
  	!!current_user
  end

  def require_admin
  	if !logged_in? || (logged_in? and !current_user.admin?)
  		flash[:danger] = "Only admin can perform that action"
  		redirect_to admin_login_path
  	end
  end
end
