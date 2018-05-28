class SessionsController < ApplicationController
  def new
    redirect_to root_url if current_user
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      session[:current_user_id] = user.id
      redirect_to root_url
    else
      flash[:alert] = 'Wrong email!'
      redirect_to new_session_url
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to new_session_url
  end
end
