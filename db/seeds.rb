# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Recipe.destroy_all

User.create!(
  first_name: 'Rita',
  last_name: 'Salema',
  email: 'pintorafael1999@gmail.com',
  password: 'gcm12345'
)

require 'net/http'
require 'uri'
require 'json'

puts "Getting Recipes Data"
def api_key
  ENV["API_KEY"]
end

def recipes_dataset
  uri = URI('https://dummyjson.com/recipes')
  response = Net::HTTP.get(uri)
  recipes = JSON.parse(response)
  recipes_array = recipes['recipes']

  recipes_array.each do |recipe|
    this_recipe = Recipe.create!(
      name: recipe["name"],
      ingredients_list: recipe["ingredients"],
      servings: recipe["servings"],
      instructions: recipe["instructions"],
      cook_time: recipe["cookTimeMinutes"]
    )
    photo = recipe["image"]
    file = URI.parse(photo).open
    this_recipe.photo.attach(io: file, filename: "recipe_image.jpg", content_type: "image/jpg")
    this_recipe.save
  end
end
recipes_dataset
puts "Seeding Games Data"
