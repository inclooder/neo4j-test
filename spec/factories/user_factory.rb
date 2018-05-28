# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { generate(:email) }
    name { generate(:name) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    age { rand(10..40) }
  end
end
