# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 9 fake data types...'
# User.destroy_all

9.times do
  user = User.create!(
    email: "#{Faker::Internet.email}",
    password: "#{Faker::Internet.password}",
    first_name: "#{Faker::Name.first_name}",
    last_name: "#{Faker::Name.last_name}"
  )

  boat = Boat.create!(
    city: "#{Faker::Address.city}",
    description: "#{Faker::Quote.robin}",
    category: "#{Faker::Quote.singular_siegler}",
    number_of_people: rand(0..5),
    user_id: User.first.id
  )

  booking = Booking.create!(
    start_date: "#{Faker::Date.between(from: 2.days.ago, to: Date.today)}",
    end_date: "#{Faker::Date.forward(days: 23)}",
    # confirmed: "random.choice([True, False])",
    user_id: User.first.id,
    boat_id: Boat.first.id
  )
end
puts 'Finished!'
