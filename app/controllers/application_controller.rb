class ApplicationController < ActionController::Base
  def authenticate_user!
    redirect_to new_session_url unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end
end
