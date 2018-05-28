# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    name { Faker::Name.unique.name }
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.unique.last_name }
    age { rand(10..40) }
  end
end
