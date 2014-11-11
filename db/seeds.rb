require 'faker'

# Create Users
5.times do
  user = User.new(
    first_name:       Faker::Name.first_name,
    last_name:        Faker::Name.last_name,
    email:            Faker::Internet.email,
    password:         Faker::Lorem.characters(10)
  )
  user.save!
end
users = User.all

# Admin User
user = User.new(
  first_name:       "Admin",
  last_name:        "User",
  email:            "admin@example.com",
  password:         "helloworld"
)
user.save!

# Categories
Category.create!(name: "fine arts")
Category.create!(name: "performing arts")
Category.create!(name: "digital media")
Category.create!(name: "communication")
Category.create!(name: "entertainment")
Category.create!(name: "architecture")
Category.create!(name: "interior design")
Category.create!(name: "product/industrial design")
Category.create!(name: "fashion")
categories = Category.all

# Create Asks
50.times do
  ask = Ask.new(
    project_name:         Faker::Company.name,
    project_description:  Faker::Lorem.paragraph,
    category:             categories.sample,
    skills:               Faker::Lorem.sentence,
    time_commitment:      Faker::Date.forward(30),
    location:             Faker::Address.city,
    expectations:         Faker::Lorem.paragraph,
    user:                 users.sample,
    created_at:           Faker::Date.between(4.days.ago, Date.today)
  )
  ask.save!
end
asks = Ask.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Category.count} categories created"
puts "#{Ask.count} asks created"
