namespace :db do
  desc 'Generate sample data'
  task generate_sample_data: :environment do
    User.create!(name: 'john', email: 'john@gmail.com', first_name: 'John', last_name: 'Snow', age: 22)
  end
end
