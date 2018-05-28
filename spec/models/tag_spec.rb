# frozen_string_literal: true

require 'rails_helper'

describe Tag do
  describe 'model validations' do
    it 'requires name' do
      tag = build(:tag, name: nil)
      expect(tag).not_to be_valid
    end
  end

  describe '#tweets' do
    it 'can have many tweets' do
      tag = create(:tag)
      tweets = create_list(:tweet, 5)
      tag.tweets += tweets
      expect(tag.reload.tweets).to match_array(tweets)
    end
  end
end
