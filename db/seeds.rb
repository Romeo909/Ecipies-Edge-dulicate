# require "open-uri"
# require 'json'
# require 'uri'
# require 'net/http'

# User.destroy_all
# Recipe.destroy_all
# Ingredient.destroy_all
# RecipeIngredient.destroy_all
# UserIngredient.destroy_all
# UserIngredient.destroy_all

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


# rayane = User.create!(email: "rayane@gmail.com", password: "123456", username: "Rayane")
# lena = User.create!(email: "lena@gmail.com", password: "123456", username: "Lena")
# romar = User.create!(email: "romar@gmail.com", password: "123456", username: "Romar")

# ingretient_1 = Ingredient.create(name: "aubergine", category: "vegetables")
# ingretient_2 = Ingredient.create(name: "onion", category: "vegetables")
# ingretient_3 = Ingredient.create(name: "red pepper", category: "vegetables")
# ingretient_4 = Ingredient.create(name: "spaghetti", category: "starch")
# ingretient_5 = Ingredient.create(name: "curry", category: "spices")
# ingretient_6 = Ingredient.create(name: "cloves garlic", category: "vegetables")
# ingretient_7 = Ingredient.create(name: "zucchini", category: "vegetables")
# ingretient_8 = Ingredient.create(name: "macaroni", category: "starch")
# ingretient_9 = Ingredient.create(name: "carrot", category: "vegetables")
# ingretient_10 = Ingredient.create(name: "oyster mushroom", category: "mushrooms")
# ingretient_11 = Ingredient.create(name: "gusta vegan sausage", category: "meat substitutes")


# List of 300 vegetarian ingredients
# vegetarian_ingredients = [
#   { name: "Lentils", category: "Legume" },
#   { name: "Chickpeas", category: "Legume" },
#   { name: "Spinach", category: "Leafy Green" },
#   { name: "Kale", category: "Leafy Green" },
#   { name: "Tomato", category: "Vegetable" },
#   { name: "Broccoli", category: "Vegetable" },
#   { name: "Avocado", category: "Fruit" },
#   { name: "Bell Pepper", category: "Vegetable" },
#   { name: "Sweet Potato", category: "Vegetable" },
#   { name: "Mushrooms", category: "Fungus" },
#   { name: "Cauliflower", category: "Vegetable" },
#   { name: "Zucchini", category: "Vegetable" },
#   { name: "Blueberries", category: "Fruit" },
#   { name: "Almonds", category: "Nut" },
#   { name: "Walnuts", category: "Nut" },
#   { name: "Oats", category: "Grain" },
#   { name: "Brown Rice", category: "Grain" },
#   { name: "Chia Seeds", category: "Seed" },
#   { name: "Flaxseeds", category: "Seed" },
#   { name: "Cucumber", category: "Vegetable" },
#   { name: "Eggplant", category: "Vegetable" },
#   { name: "Oranges", category: "Citrus Fruit" },
#   { name: "Bananas", category: "Fruit" },
#   { name: "Pineapple", category: "Tropical Fruit" },
#   { name: "Pomegranate", category: "Fruit" },
#   { name: "Red Lentils", category: "Legume" },
#   { name: "Black Beans", category: "Legume" },
#   { name: "Cherry Tomatoes", category: "Vegetable" },
#   { name: "Cabbage", category: "Vegetable" },
#   { name: "Artichoke", category: "Vegetable" },
#   { name: "Asparagus", category: "Vegetable" },
#   { name: "Pumpkin", category: "Vegetable" },
#   { name: "Cilantro", category: "Herb" },
#   { name: "Thyme", category: "Herb" },
#   { name: "Basil", category: "Herb" },
#   { name: "Cinnamon", category: "Spice" },
#   { name: "Turmeric", category: "Spice" },
#   { name: "Ginger", category: "Root" },
#   { name: "Garlic", category: "Bulb" },
#   { name: "Onion", category: "Bulb" },
#   { name: "Cranberries", category: "Berry" },
#   { name: "Raspberries", category: "Berry" },
#   { name: "Pears", category: "Fruit" },
#   { name: "Cantaloupe", category: "Melon" },
#   { name: "Peaches", category: "Fruit" },
#   { name: "Celery", category: "Vegetable" },
#   { name: "Carrots", category: "Vegetable" },
#   { name: "Radishes", category: "Vegetable" },
#   { name: "Beets", category: "Vegetable" },
#   { name: "Kiwis", category: "Fruit" },
#   { name: "Hazelnuts", category: "Nut" },
#   { name: "Cashews", category: "Nut" },
#   { name: "Sunflower Seeds", category: "Seed" },
#   { name: "Pumpkin Seeds", category: "Seed" },
#   { name: "Arugula", category: "Leafy Green" },
#   { name: "Romaine Lettuce", category: "Leafy Green" },
#   { name: "Parsley", category: "Herb" },
#   { name: "Mango", category: "Tropical Fruit" },
#   { name: "Cantaloupe", category: "Melon" },
#   { name: "Apricots", category: "Fruit" },
#   { name: "Coconut", category: "Nut" },
#   { name: "Seaweed", category: "Algae" },
#   { name: "Brussels Sprouts", category: "Vegetable" },
#   { name: "Green Beans", category: "Vegetable" },
#   { name: "Leeks", category: "Vegetable" },
#   { name: "Parsnips", category: "Vegetable" },
#   { name: "Jicama", category: "Vegetable" },
#   { name: "Watermelon", category: "Melon" },
#   { name: "Kiwi", category: "Fruit" },
#   { name: "Cranberries", category: "Berry" },
#   { name: "Clementines", category: "Citrus Fruit" },
#   { name: "Cantaloupe", category: "Melon" },
#   { name: "Dates", category: "Fruit" },
#   { name: "Cabbage", category: "Vegetable" },
#   { name: "Butternut Squash", category: "Vegetable" },
#   { name: "Artichokes", category: "Vegetable" },
#   { name: "Peas", category: "Vegetable" },
#   { name: "Brussels Sprouts", category: "Vegetable" },
#   { name: "Mint", category: "Herb" },
#   { name: "Rosemary", category: "Herb" },
#   { name: "Coriander", category: "Herb" },
#   { name: "Cumin", category: "Spice" },
#   { name: "Nutmeg", category: "Spice" },
#   { name: "Paprika", category: "Spice" },
#   # Continue adding more ingredients in a similar format
#   # ...
# ]

# # Create instances using the list
# vegetarian_ingredients.each do |ingredient_data|
#   Ingredient.create(ingredient_data)
# end

# p vegetarian_ingredients



# UserIngredient.create!(user: rayane, ingredient: ingretient_1)
# UserIngredient.create!(user: romar, ingredient: ingretient_2)
# UserIngredient.create!(user: lena, ingredient: ingretient_3)
# UserIngredient.create!(user: rayane, ingredient: ingretient_4)
# UserIngredient.create!(user: romar, ingredient: ingretient_1)
# UserIngredient.create!(user: lena, ingredient: ingretient_2)
# UserIngredient.create!(user: rayane, ingredient: ingretient_3)
# UserIngredient.create!(user: romar, ingredient: ingretient_4)
# UserIngredient.create!(user: lena, ingredient: ingretient_1)

# Recipe.create!(name: "Pasta", instructions: "Pasta with tomato sauce", servings: 2, cooking_time: 20)
# Recipe.create!(name: "Vegetable satay curry", instructions: "This creamy vegan curry is packed with plenty of nutritious veggies, warming ginger and chilli for a healthy meat-free meal", servings: 3, cooking_time: 30)
# Recipe.create!(name: "Chicken & chorizo jambalaya", instructions: "This Creole one-pot is bursting with spicy chorizo, succulent chicken and tender veg. It's quick to make and packed with flavour - the perfect midweek meal", servings: 4, cooking_time: 40)
# Recipe.create!(name: "Pasta", instructions: "Pasta with tomato sauce", servings: 2, cooking_time: 20, ingredients: %(spaghetti, red pepper, oignon))
# Recipe.create!(name: "Vegetable satay curry", instructions: "This creamy vegan curry is packed with plenty of nutritious veggies, warming ginger and chilli for a healthy meat-free meal", servings: 3, cooking_time: 30, ingredients: %(curry, carrot, oignon))
# Recipe.create!(name: "Vegetarian chicken & chorizo jambalaya", instructions: "This Creole one-pot is bursting with spicy chorizo, succulent chicken and tender veg. It's quick to make and packed with flavour - try the vegetarian version for the perfect midweek meal", servings: 4, cooking_time: 40, ingredients: ["oyster mushroom", "red pepper", "oignon", "gusta vegan sausage"])


# RecipeIngredient.create!(recipe: Recipe.first, ingredient: ingretient_1)
# RecipeIngredient.create!(recipe: Recipe.first, ingredient: ingretient_2)
# RecipeIngredient.create!(recipe: Recipe.first, ingredient: ingretient_3)
# RecipeIngredient.create!(recipe: Recipe.first, ingredient: ingretient_4)
# RecipeIngredient.create!(recipe: Recipe.second, ingredient: ingretient_1)
# RecipeIngredient.create!(recipe: Recipe.second, ingredient: ingretient_2)
# RecipeIngredient.create!(recipe: Recipe.second, ingredient: ingretient_3)
# RecipeIngredient.create!(recipe: Recipe.second, ingredient: ingretient_4)

# UserRecipe.create!(user: rayane, recipe: Recipe.first)
# UserRecipe.create!(user: lena, recipe: Recipe.second)
# UserRecipe.create!(user: romar, recipe: Recipe.third)
# UserRecipe.create!(user: rayane, recipe: Recipe.second)
# UserRecipe.create!(user: lena, recipe: Recipe.third)
# UserRecipe.create!(user: romar, recipe: Recipe.first)
# UserRecipe.create!(user: rayane, recipe: Recipe.third)
# UserRecipe.create!(user: lena, recipe: Recipe.first)
