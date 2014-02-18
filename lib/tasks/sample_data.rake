# introduced in section 9.3.2

namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    admin = Member.create!(name: 'Intae the Great', email: 'greatkit@gmail.com', password: '1234567890', password_confirmation: '1234567890', admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = 'password0'
      Member.create!(name: name, email: email, password: password, password_confirmation: password)
    end
  end
end
