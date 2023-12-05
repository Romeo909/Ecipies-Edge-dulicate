# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create 5 users
User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all
UserIngredient.destroy_all
UserIngredient.destroy_all


rayane = User.create!(email: "rayane@gmail.com", password: "123456", username: "Rayane")
lena = User.create!(email: "lena@gmail.com", password: "123456", username: "Lena")
romar = User.create!(email: "romar@gmail.com", password: "123456", username: "Romar")

Recipe.create!(name: "Pasta", instructions: "Pasta with tomato sauce", servings: 2, cooking_time: 20)
Recipe.create!(name: "Vegetable satay curry", instructions: "This creamy vegan curry is packed with plenty of nutritious veggies, warming ginger and chilli for a healthy meat-free meal", servings: 3, cooking_time: 30)
Recipe.create!(name: "Chicken & chorizo jambalaya", instructions: "This Creole one-pot is bursting with spicy chorizo, succulent chicken and tender veg. It's quick to make and packed with flavour - the perfect midweek meal", servings: 4, cooking_time: 40)

ingretient_1 = Ingredient.create(name: "aubergine")
ingretient_2 = Ingredient.create(name: "onion")
ingretient_3 = Ingredient.create(name: "red pepper")
ingretient_4 = Ingredient.create(name: "cloves garlic")

UserIngredient.create!(user: rayane, ingredient: ingretient_1)
UserIngredient.create!(user: romar, ingredient: ingretient_2)
UserIngredient.create!(user: lena, ingredient: ingretient_3)
UserIngredient.create!(user: rayane, ingredient: ingretient_4)
UserIngredient.create!(user: romar, ingredient: ingretient_1)
UserIngredient.create!(user: lena, ingredient: ingretient_2)
UserIngredient.create!(user: rayane, ingredient: ingretient_3)
UserIngredient.create!(user: romar, ingredient: ingretient_4)
UserIngredient.create!(user: lena, ingredient: ingretient_1)


RecipeIngredient.create!(recipe: Recipe.first, ingredient: ingretient_1)
RecipeIngredient.create!(recipe: Recipe.first, ingredient: ingretient_2)
RecipeIngredient.create!(recipe: Recipe.first, ingredient: ingretient_3)
RecipeIngredient.create!(recipe: Recipe.first, ingredient: ingretient_4)
RecipeIngredient.create!(recipe: Recipe.second, ingredient: ingretient_1)
RecipeIngredient.create!(recipe: Recipe.second, ingredient: ingretient_2)
RecipeIngredient.create!(recipe: Recipe.second, ingredient: ingretient_3)
RecipeIngredient.create!(recipe: Recipe.second, ingredient: ingretient_4)

UserRecipe.create!(user: rayane, recipe: Recipe.first)
UserRecipe.create!(user: lena, recipe: Recipe.second)
UserRecipe.create!(user: romar, recipe: Recipe.third)
UserRecipe.create!(user: rayane, recipe: Recipe.second)
UserRecipe.create!(user: lena, recipe: Recipe.third)
UserRecipe.create!(user: romar, recipe: Recipe.first)
UserRecipe.create!(user: rayane, recipe: Recipe.third)
UserRecipe.create!(user: lena, recipe: Recipe.first)