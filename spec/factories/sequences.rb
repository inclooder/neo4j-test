# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "#{Faker::Internet.user_name.downcase}#{n}@mail.com"
  end

  sequence :name do |n|
    "#{Faker::Internet.user_name.downcase}#{n}"
  end
end
