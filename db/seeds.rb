require 'faker'

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

# Create Users
5.times do
  user = User.new(
    first_name:       Faker::Name.first_name,
    last_name:        Faker::Name.last_name,
    email:            Faker::Internet.email,
    password:         Faker::Lorem.characters(10),
    category_id:      categories.sample.id,
    location:         Faker::Address.city,
    skill:            Faker::Lorem.sentence,
    status:           Faker::Name.title,
    achievement:      Faker::Lorem.paragraph,
    portfolio:        Faker::Internet.url,
    avatar:           Faker::Avatar.image
  )
  user.save!
end
users = User.all

# Admin User
user = User.new(
  first_name:       "Admin",
  last_name:        "User",
  email:            "admin@example.com",
  password:         "helloworld",
  location:         Faker::Address.city,
  skill:            Faker::Lorem.sentence,
  status:           Faker::Name.title,
  achievement:      Faker::Lorem.paragraph,
  portfolio:        Faker::Internet.url,
  category_id:      categories.sample.id,
  avatar:           Faker::Avatar.image
)
user.save!

# Create Asks
50.times do
  ask = Ask.new(
    project_name:         Faker::Company.name,
    project_description:  Faker::Lorem.paragraph,
    category:             categories.sample,
    skills:                Faker::Lorem.sentence,
    time_commitment:      (1 + rand(7)).to_s + " days",
    location:             Faker::Address.city,
    expectations:         Faker::Lorem.paragraph,
    user:                 users.sample,
    created_at:           Faker::Date.between(4.days.ago, Date.today)
  )
  ask.save!
end
asks = Ask.all

# Create Offers
200.times do
  offer = Offer.new(
    body:         Faker::Lorem.paragraph,
    created_at:   Faker::Date.between(4.days.ago, Date.today),
    user:         users.sample,
    ask:          asks.sample
  )
  offer.save!
end
offers = Offer.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Category.count} categories created"
puts "#{Ask.count} asks created"
puts "#{Offer.count} offers created"
