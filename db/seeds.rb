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


# Add imgae to recipe
require "open-uri"
require 'json'
require 'uri'
require 'net/http'

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
    instructionRequest["X-RapidAPI-Key"] = RAPIDAPI_KEY
    instructionRequest["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
    instructionResponse = instructionHTTP.request(instructionRequest)
    instruction = JSON.parse(instructionResponse.read_body)
end

# url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/random?number=10&tags=vegetarian%2Cdessert")

url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?query=vegetarian")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = '7ccb6132b8mshf9945187788cf15p1732e8jsnd2880a641b78'
request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

response = http.request(request)
recipes = JSON.parse(response.read_body)["results"]

imageBaseUrl = "https://spoonacular.com/recipeImages/"

recipes.each do |recipe|
    # instruction = "#{baseUrl}/#{recipe["id"]}/information"
   instructions = getInstruction(recipe["id"])
   instruction = instructions["instructions"]
   extendedIngredients = instructions["extendedIngredients"]
   newRecipe = Recipe.new(name: recipe["title"], instructions: instruction, servings: recipe["servings"], cooking_time: recipe["readyInMinutes"], ingredients: extendedIngredients.map{|ingredient| ingredient["name"]}.join(", "))
   file = URI.open("#{imageBaseUrl}#{recipe["image"]}")
    newRecipe.image.attach(io: file, filename: "#{recipe["title"].strip}.png", content_type: "image/png")
   newRecipe.save
end




rayane = User.create!(email: "rayane@gmail.com", password: "123456", username: "Rayane")
lena = User.create!(email: "lena@gmail.com", password: "123456", username: "Lena")
romar = User.create!(email: "romar@gmail.com", password: "123456", username: "Romar")

ingretient_1 = Ingredient.create(name: "aubergine", category: "vegetables")
ingretient_2 = Ingredient.create(name: "onion", category: "vegetables")
ingretient_3 = Ingredient.create(name: "red pepper", category: "vegetables")
ingretient_4 = Ingredient.create(name: "spaghetti", category: "starch")
ingretient_5 = Ingredient.create(name: "curry", category: "spices")
ingretient_6 = Ingredient.create(name: "cloves garlic", category: "vegetables")
ingretient_7 = Ingredient.create(name: "zucchini", category: "vegetables")
ingretient_8 = Ingredient.create(name: "macaroni", category: "starch")
ingretient_9 = Ingredient.create(name: "carrot", category: "vegetables")
ingretient_10 = Ingredient.create(name: "oyster mushroom", category: "mushrooms")
ingretient_11 = Ingredient.create(name: "gusta vegan sausage", category: "meat substitutes")

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
