class ApplicationController < ActionController::Base
  def authenticate_user!
    redirect_to new_session_path if session[:current_user_id].nil?
  end

  def current_user
    @current_user ||= User.find(session[:current_user_id])
  end
end
