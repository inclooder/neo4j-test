# frozen_string_literal: true
require 'rails_helper'

describe User do
  describe 'find_by' do
    it 'returns correct record' do
      user = create(:user)
      db_user = User.find_by(email: user.email)
      expect(db_user).to eq(user)
    end
  end

  describe '#tweets' do
    it 'can have many tweets' do
      user = create(:user)
      tweets = create_list(:tweet, 5)
      user.tweets += tweets
      user.save!

      user.reload
      expect(user.tweets.to_a).to match_array(tweets)
    end
  end
end
