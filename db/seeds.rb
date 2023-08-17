# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'faker'



puts "seeding database"

  20.times do
    restaurant = Restaurant.new(
      name: Faker::Restaurant.name,
      address: Faker::Address.city,
      phone_number: Faker::PhoneNumber.phone_number_with_country_code,
      category: ["chinese", "italian", "japanese", "french", "belgian"].sample
    )
    restaurant.save!

    2.times do
      review = Review.new(
        rating: (0..5).to_a.sample,
        content: Faker::Restaurant.review,
      )
    review.restaurant = restaurant
    review.save!
    end

    puts "created restuarant #{restaurant.id}"
  # movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
  # Character.create(name: "Luke", movie: movies.first)
end
