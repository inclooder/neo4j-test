namespace :db do
  desc 'Generate sample data'
  task generate_sample_data: :environment do
    require 'faker'
    require 'factory_bot'
    FactoryBot.find_definitions

    users = FactoryBot.create_list(:user, 1000)
    puts "Users generated."
    tags = FactoryBot.create_list(:tag, 20)
    puts "Tags generated."
    users.each do |user|
      FactoryBot.create_list(
        :tweet,
        rand(20..100),
        author: user,
        tags: tags.sample(rand(0..5)),
        mentions: users.sample(rand(0..8))
      )
      puts "Tweets for #{user.name} generated."
    end
  end
end
