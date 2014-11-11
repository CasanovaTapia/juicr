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

# Create Categories
8.times do
  category = Category.new(
    name: Faker::Commerce.color
  )
  category.save!
end
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
