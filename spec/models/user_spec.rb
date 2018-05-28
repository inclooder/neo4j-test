# frozen_string_literal: true
require 'rails_helper'

describe User do
  describe 'model validations' do
    it 'requires email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it 'validates uniqueness of email' do
      create(:user, email: 'a@a.pl')
      expect(build(:user, email: 'a@a.pl')).not_to be_valid
    end

    it 'requires name' do
      user = build(:user, name: nil)
      expect(user).not_to be_valid
    end

    it 'validates uniqueness of name' do
      create(:user, name: 'john')
      expect(build(:user, name: 'john')).not_to be_valid
    end

    it 'validates name to be in lowercase' do
      expect(build(:user, name: 'John')).not_to be_valid
    end
  end

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

  describe '#followers' do
    it 'can have many followers' do
      follower = create(:user)
      followees = create_list(:user, 3)
      follower.followees += followees
      expect(follower.reload.followees).to match_array(followees)
    end
  end

  describe '#followees' do
    it 'can have many followers' do
      followee = create(:user)
      followers = create_list(:user, 3)
      followee.followers += followers
      expect(followee.reload.followers).to match_array(followers)
    end
  end
end
