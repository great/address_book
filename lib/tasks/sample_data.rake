# introduced in section 9.3.2

namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    Member.create!(name: 'Example User', email: 'example@railstutorial.org', password: 'password0', password_confirmation: 'password0')
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = 'password0'
      Member.create!(name: name, email: email, password: password, password_confirmation: password)
    end
  end
end
