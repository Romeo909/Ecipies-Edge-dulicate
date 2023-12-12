# require "open-uri"
# require 'json'
# require 'uri'
# require 'net/http'

User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all
UserIngredient.destroy_all
UserIngredient.destroy_all

# def getInstruction(id)
#   instructionURL = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/#{id}/information")
#   instructionHTTP = Net::HTTP.new(instructionURL.host, instructionURL.port)
#   instructionHTTP.use_ssl = true
#   instructionRequest = Net::HTTP::Get.new(instructionURL)
#   instructionRequest["X-RapidAPI-Key"] = ENV['RAPID_API_KEY']
#   instructionRequest["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
#   instructionResponse = instructionHTTP.request(instructionRequest)
#   instruction = JSON.parse(instructionResponse.read_body)
# end

# url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/random?number=10&tags=vegetarian%2Cdessert")

# url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?query=vegetarian")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true

# request = Net::HTTP::Get.new(url)
# request["X-RapidAPI-Key"] = ENV['RAPID_API_KEY']
# request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

# response = http.request(request)
# recipes = JSON.parse(response.read_body)["results"]

# imageBaseUrl = "https://spoonacular.com/recipeImages/"

# recipes.each do |recipe|
#     # instruction = "#{baseUrl}/#{recipe["id"]}/information"
#    instructions = getInstruction(recipe["id"])
#    instruction = instructions["instructions"]
#    extendedIngredients = instructions["extendedIngredients"]
#    newRecipe = Recipe.new(name: recipe["title"], instructions: instruction, servings: recipe["servings"], cooking_time: recipe["readyInMinutes"], ingredients: extendedIngredients.map{|ingredient| ingredient["name"]}.join(", "))
#    file = URI.open("#{imageBaseUrl}#{recipe["image"]}")
#     newRecipe.image.attach(io: file, filename: "#{recipe["title"].strip}.png", content_type: "image/png")
#    newRecipe.save
# end


rayane = User.create!(email: "rayane@gmail.com", password: "123456", username: "Rayane")
lena = User.create!(email: "lena@gmail.com", password: "123456", username: "Lena")
romar = User.create!(email: "romar@gmail.com", password: "123456", username: "Romar")

Category.create!(name: "vegetables")
Category.create!(name: "fruits")
Category.create!(name: "starch")
Category.create!(name: "flour")
Category.create!(name: "mushrooms")
Category.create!(name: "spices")
Category.create!(name: "meat substitute")
Category.create!(name: "legumes")

ingretient_1 = Ingredient.create(name: "aubergine", category_id: 1)
ingretient_2 = Ingredient.create(name: "onion", category_id: 1)
ingretient_3 = Ingredient.create(name: "red pepper", category_id: 1)
ingretient_4 = Ingredient.create(name: "spaghetti", category_id: 3)
ingretient_5 = Ingredient.create(name: "curry", category_id: 6)
ingretient_6 = Ingredient.create(name: "cloves garlic", category_id: 1)
ingretient_7 = Ingredient.create(name: "zucchini", category_id: 1)
ingretient_8 = Ingredient.create(name: "macaroni", category_id: 3)
ingretient_9 = Ingredient.create(name: "carrot", category_id: 1)
ingretient_10 = Ingredient.create(name: "oyster mushroom", category_id: 5)
ingretient_11 = Ingredient.create(name: "gusta vegan sausage", category_id: 7)


UserIngredient.create!(user: rayane, ingredient: ingretient_1)
UserIngredient.create!(user: romar, ingredient: ingretient_2)
UserIngredient.create!(user: lena, ingredient: ingretient_3)
UserIngredient.create!(user: rayane, ingredient: ingretient_4)
UserIngredient.create!(user: romar, ingredient: ingretient_1)
UserIngredient.create!(user: lena, ingredient: ingretient_2)
UserIngredient.create!(user: rayane, ingredient: ingretient_3)
UserIngredient.create!(user: romar, ingredient: ingretient_4)
UserIngredient.create!(user: lena, ingredient: ingretient_1)

Recipe.create!(name: "Pasta", instructions: "Pasta with tomato sauce", servings: 2, cooking_time: 20)
Recipe.create!(name: "Vegetable satay curry", instructions: "This creamy vegan curry is packed with plenty of nutritious veggies, warming ginger and chilli for a healthy meat-free meal", servings: 3, cooking_time: 30)
Recipe.create!(name: "Chicken & chorizo jambalaya", instructions: "This Creole one-pot is bursting with spicy chorizo, succulent chicken and tender veg. It's quick to make and packed with flavour - the perfect midweek meal", servings: 4, cooking_time: 40)
Recipe.create!(name: "Pasta", instructions: "Pasta with tomato sauce", servings: 2, cooking_time: 20, ingredients: %(spaghetti, red pepper, oignon))
Recipe.create!(name: "Vegetable satay curry", instructions: "This creamy vegan curry is packed with plenty of nutritious veggies, warming ginger and chilli for a healthy meat-free meal", servings: 3, cooking_time: 30, ingredients: %(curry, carrot, oignon))
Recipe.create!(name: "Vegetarian chicken & chorizo jambalaya", instructions: "This Creole one-pot is bursting with spicy chorizo, succulent chicken and tender veg. It's quick to make and packed with flavour - try the vegetarian version for the perfect midweek meal", servings: 4, cooking_time: 40, ingredients: ["oyster mushroom", "red pepper", "oignon", "gusta vegan sausage"])


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
