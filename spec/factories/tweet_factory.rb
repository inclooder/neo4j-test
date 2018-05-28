FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.sentence }
    association :author, factory: :user
    mentions nil
    tags nil
  end
end
