class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  rescue_from ActionController::RedirectBackError, with: :redirect_to_default

  def logged_in?
    !!current_user
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_log_in
    if !logged_in?
      flash[:message] = "Please log in or sign up!"
      redirect_to root_path
    end
  end

  def admin?
    if current_user && !current_user.admin
        flash[:message] = "You must be a system administrator to access that action."
        redirect_to root_path
    end
  end

  def already_logged_in?
    if current_user
      flash[:message] = "You are already logged in. Please log out if you would like to log in as a new user."
      redirect_to :back
    end
  end

  def redirect_to_default
    redirect_to root_path
  end
end
