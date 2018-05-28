class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.as(:tweets).yield_self do |tweets|
      if params[:tag].present?
        tweets.tags(:tag).where('tag.name = ?', params[:tag]) if params[:tag].present?
      else
        tweets
      end
    end.pluck(:tweets)
  end

  def create
  end
end
