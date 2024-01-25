# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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

# Create users
user1 = User.create!(
  name: 'user1',
  email: 'user1@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)

user2 = User.create!(
  name: 'user2',
  email: 'user2@example.com',
  password: 'password456',
  password_confirmation: 'password456'
)

# Create foods
food1 = Food.create!(
  food: 'Apple',
  measurement_unit: 'Piece',
  price: 2,
  user: user1
)

food2 = Food.create!(
  food: 'Chicken',
  measurement_unit: 'Kilogram',
  price: 10,
  user: user2
)
