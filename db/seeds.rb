# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed from Rapid API
# require 'uri'
# require 'net/http'

User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all
UserIngredient.destroy_all
UserIngredient.destroy_all


def getInstruction(id)
    instructionURL = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/#{id}/information")
    instructionHTTP = Net::HTTP.new(instructionURL.host, instructionURL.port)
    instructionHTTP.use_ssl = true
    instructionRequest = Net::HTTP::Get.new(instructionURL)
    instructionRequest["X-RapidAPI-Key"] = '7ccb6132b8mshf9945187788cf15p1732e8jsnd2880a641b78'
    instructionRequest["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
    instructionResponse = instructionHTTP.request(instructionRequest)
    instruction = JSON.parse(instructionResponse.read_body)
end

# url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/random?number=10&tags=vegetarian%2Cdessert")


require 'json'
# url = URI("https://tasty.p.rapidapi.com/recipes/auto-complete?prefix=chicken%20soup")
require 'uri'
require 'net/http'

url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?query=vegetarian")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = '7ccb6132b8mshf9945187788cf15p1732e8jsnd2880a641b78'
request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

response = http.request(request)
recipes = JSON.parse(response.read_body)["results"]

recipes.each do |recipe|
    # instruction = "#{baseUrl}/#{recipe["id"]}/information"
   instructions = getInstruction(recipe["id"])
   instruction = instructions["instructions"]
   extendedIngredients = instructions["extendedIngredients"]
   Recipe.create!(name: recipe["title"], instructions: instruction, servings: recipe["servings"], cooking_time: recipe["readyInMinutes"], ingredients: extendedIngredients.map{|ingredient| ingredient["name"]}.join(", "))
end




rayane = User.create!(email: "rayane@gmail.com", password: "123456", username: "Rayane")
lena = User.create!(email: "lena@gmail.com", password: "123456", username: "Lena")
romar = User.create!(email: "romar@gmail.com", password: "123456", username: "Romar")

ingretient_1 = Ingredient.create(name: "aubergine")
ingretient_2 = Ingredient.create(name: "onion")
ingretient_3 = Ingredient.create(name: "red pepper")
ingretient_4 = Ingredient.create(name: "spaghetti")
ingretient_5 = Ingredient.create(name: "curry")
ingretient_6 = Ingredient.create(name: "cloves garlic")
ingretient_7 = Ingredient.create(name: "zucchini")
ingretient_8 = Ingredient.create(name: "macaroni")
ingretient_9 = Ingredient.create(name: "carrot")
ingretient_10 = Ingredient.create(name: "oyster mushroom")
ingretient_11 = Ingredient.create(name: "gusta vegan sausage")

UserIngredient.create!(user: rayane, ingredient: ingretient_1)
UserIngredient.create!(user: romar, ingredient: ingretient_2)
UserIngredient.create!(user: lena, ingredient: ingretient_3)
UserIngredient.create!(user: rayane, ingredient: ingretient_4)
UserIngredient.create!(user: romar, ingredient: ingretient_1)
UserIngredient.create!(user: lena, ingredient: ingretient_2)
UserIngredient.create!(user: rayane, ingredient: ingretient_3)
UserIngredient.create!(user: romar, ingredient: ingretient_4)
UserIngredient.create!(user: lena, ingredient: ingretient_1)


# RecipeIngredient.create!(recipe: Recipe.first, ingredient: ingretient_1)
# RecipeIngredient.create!(recipe: Recipe.first, ingredient: ingretient_2)
# RecipeIngredient.create!(recipe: Recipe.first, ingredient: ingretient_3)
# RecipeIngredient.create!(recipe: Recipe.first, ingredient: ingretient_4)
# RecipeIngredient.create!(recipe: Recipe.second, ingredient: ingretient_1)
# RecipeIngredient.create!(recipe: Recipe.second, ingredient: ingretient_2)
# RecipeIngredient.create!(recipe: Recipe.second, ingredient: ingretient_3)
# RecipeIngredient.create!(recipe: Recipe.second, ingredient: ingretient_4)

UserRecipe.create!(user: rayane, recipe: Recipe.first)
UserRecipe.create!(user: lena, recipe: Recipe.second)
UserRecipe.create!(user: romar, recipe: Recipe.third)
UserRecipe.create!(user: rayane, recipe: Recipe.second)
UserRecipe.create!(user: lena, recipe: Recipe.third)
UserRecipe.create!(user: romar, recipe: Recipe.first)
UserRecipe.create!(user: rayane, recipe: Recipe.third)
UserRecipe.create!(user: lena, recipe: Recipe.first)
