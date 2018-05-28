FactoryBot.define do
  factory :tweet do
    association :author, factory: :user
    mentions []
    tags []
    body do
      (mentions + tags).shuffle.map do |elem|
        prefix = elem.is_a?(User) ? '@' : '#'
        "#{Faker::Lorem.sentence} #{prefix}#{elem.name} "
      end.join('') + Faker::Lorem.sentence
    end
  end
end
