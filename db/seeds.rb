# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"
puts 'Cleaning the database'
Booking.delete_all
Boat.delete_all
User.delete_all

puts 'Creating 9 fake user data...'
# User.destroy_all

9.times do
  user = User.create!(
    email: "#{Faker::Internet.email}",
    password: "#{Faker::Internet.password}",
    first_name: "#{Faker::Name.first_name}",
    last_name: "#{Faker::Name.last_name}"
  )
end
file1 = URI.open('https://res.cloudinary.com/nexinus/image/upload/v1590679949/sail1_stxy5b.jpg')
file2 = URI.open('https://res.cloudinary.com/nexinus/image/upload/v1590679949/sail2_go0jtr.jpg')
boat1 = Boat.new(
  city: "#{Faker::Address.city}",
  description: "A nice boat for relaxation.",
  category: "Sailing",
  number_of_people: rand(1..5),
  user: User.last
)
boat1.photos.attach(io: file1, filename: "sail1_stxy5b.jpg", content_type: "image/jpg")
boat1.photos.attach(io: file2, filename: "sail2_go0jtr.jpg", content_type: "image/jpg")
boat1.save

file1 = URI.open('https://res.cloudinary.com/nexinus/image/upload/v1590679949/party1_grlxnf.jpg')
file2 = URI.open('https://res.cloudinary.com/nexinus/image/upload/v1590679949/party2_co5fgt.jpg')
boat2 = Boat.new(
  city: "#{Faker::Address.city}",
  description: "The perfect boat for adventure",
  category: "Speed",
  number_of_people: rand(1..5),
  user: User.last
)
boat2.photos.attach(io: file1, filename: "party1_grlxnf.jpg", content_type: "image/jpg")
boat2.photos.attach(io: file2, filename: "party2_co5fgt.jpg", content_type: "image/jpg")
boat2.save

file1 = URI.open('https://res.cloudinary.com/nexinus/image/upload/v1590679949/yacht1_dljidc.jpg')
file2 = URI.open('https://res.cloudinary.com/nexinus/image/upload/v1590679949/yacht2_pfa5yt.jpg')
boat3 = Boat.new(
  city: "#{Faker::Address.city}",
  description: "Fully set up for party boat!",
  category: "Yacht",
  number_of_people: rand(1..5),
  user: User.last
)
boat3.photos.attach(io: file1, filename: "yacht1_dljidc.jpg", content_type: "image/jpg")
boat3.photos.attach(io: file2, filename: "yacht2_pfa5yt.jpg", content_type: "image/jpg")
boat3.save

users = User.all
booking = Booking.create!(
  start_date: "#{Faker::Date.between(from: 2.days.ago, to: Date.today)}",
  end_date: "#{Faker::Date.forward(days: 23)}",
  confirmed: "random.choice([True, False])",
  user: users.sample,
  boat: boat1
)
booking = Booking.create!(
  start_date: "#{Faker::Date.between(from: 2.days.ago, to: Date.today)}",
  end_date: "#{Faker::Date.forward(days: 23)}",
  confirmed: "random.choice([True, False])",
  user: users.sample,
  boat: boat2
)
booking = Booking.create!(
  start_date: "#{Faker::Date.between(from: 2.days.ago, to: Date.today)}",
  end_date: "#{Faker::Date.forward(days: 23)}",
  confirmed: "random.choice([True, False])",
  user: users.sample,
  boat: boat3
)

puts 'Finished!'
