namespace :db do
  desc 'Generate sample data'
  task generate_sample_data: :environment do
    require 'faker'
    require 'factory_bot'
    FactoryBot.find_definitions

    users = FactoryBot.create_list(:user, 10)
    puts 'Users generated.'
    tags = FactoryBot.create_list(:tag, 20)
    puts 'Tags generated.'
    users.each do |user|
      rand(10..30).times do
        FactoryBot.create(
          :tweet,
          author: user,
          tags: tags.sample(rand(1..5)),
          mentions: (users - user).sample(rand(1..8))
        )
      end
      puts "Tweets for #{user.name} generated."
    end
  end
end
