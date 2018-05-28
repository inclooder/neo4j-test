class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    user = User.find_by!(name: params[:name])
    tweets = user.tweets
    is_following = user.followers.include?(current_user)
    render locals: { user: user, tweets: tweets, is_following: is_following }
  end
end
