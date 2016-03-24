class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :check_user_logged_in?

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def check_user_logged_in?
    redirect_to new_session_path unless current_user
  end

end
