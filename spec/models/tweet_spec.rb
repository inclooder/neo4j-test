# frozen_string_literal: true

require 'rails_helper'

describe Tweet do
  describe 'model validations' do
    it 'requires author' do
      tweet = build(:tweet, author: nil)
      expect(tweet).not_to be_valid
    end

    it 'requires body' do
      tweet = build(:tweet, body: nil)
      expect(tweet).not_to be_valid
    end
  end

  describe '#mentions' do
    it 'can have many mentions' do
      mentions = create_list(:user, 5)
      tweet = create(:tweet, mentions: mentions)
      expect(tweet.reload.mentions).to match_array(mentions)
    end
  end
end
