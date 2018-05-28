class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = current_user.tweets(:tweets).yield_self do |tweets|
      if params[:tag].present?
        tweets.tags(:tag).where('tag.name = ?', params[:tag]) if params[:tag].present?
      else
        tweets
      end
    end.yield_self do |tweets|
      Paginator.new(tweets).page(params[:page]).pluck(:tweets)
    end
  end

  def create
  end
end
