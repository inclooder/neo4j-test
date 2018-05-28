class FollowershipsController < ApplicationController
  before_action :authenticate_user!

  def create
    head :not_found && return if params.require(:followee_name) == current_user.name
    followee = User.find_by!(name: params.require(:followee_name))
    followee.followers << current_user
    followee.save!
    redirect_back fallback_location: followee
  end

  def destroy
    head :not_found && return if params[:name] == current_user.name
    followee = User.find_by!(name: params[:name])
    followee.followers.delete(current_user)
    followee.save!
    redirect_back fallback_location: followee
  end
end
