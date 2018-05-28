class FollowershipsController < ApplicationController
  before_action :authenticate_user!

  def create
    followee = User.find_by!(name: params.require(:followee_name))
    followee.followers << current_user
    followee.save!
    redirect_back fallback_location: followee
  end

  def destroy
    followee = User.find_by!(name: params[:name])
    followee.followers.delete(current_user)
    followee.save!
    redirect_back fallback_location: followee
  end
end
