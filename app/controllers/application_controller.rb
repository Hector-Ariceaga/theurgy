class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_patient
  helper_method :logged_in?

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

  def current_patient
    @current_patient ||= Patient.find_by(id: params[:id]) if params[:id]
  end

  def admin?
    if current_user && !current_user.admin
        flash[:message] = "You must be a system administrator to access that action."
        redirect_to root_path
    end
  end
end
