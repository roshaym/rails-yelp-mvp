# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# 1. Clean the database 🗑️

TYPE = ["chinese", "italian", "japanese", "french", "belgian"]

puts "Cleaning database..."
Restaurant.destroy_all

# require 'faker'

puts 'Creating 5 fake restaurants...'
5.times do
  restaurant = Restaurant.new(
    name:    Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber,
    category: TYPE[rand(0..4)]
  )
  restaurant.save!
  puts restaurant.category
end
puts "Finished! Created #{Restaurant.count} restaurants."


# # 2. Create the instances 🏗️
# puts "Creating restaurants..."
# Restaurant.create!(name: "Dishoom", address: "7 Boundary St, London E2 7JE")
# puts "Created Dishoom"
# Restaurant.create!(name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ")
# puts "Created Pizza East"

# # 3. Display a message 🎉
# puts "Finished! Created #{Restaurant.count} restaurants."
