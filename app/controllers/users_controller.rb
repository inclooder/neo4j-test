class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    user = User.find_by!(name: params[:name])
    tweets = user.tweets
    render locals: { user: user, tweets: tweets }
  end
end
