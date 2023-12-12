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
  instructionRequest["X-RapidAPI-Key"] = ENV['RAPID_API_KEY']
  instructionRequest["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
  instructionResponse = instructionHTTP.request(instructionRequest)
  instruction = JSON.parse(instructionResponse.read_body)
end

url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/random?number=10&tags=vegetarian%2Cdessert")

url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?query=vegetarian")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = ENV['RAPID_API_KEY']
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
ingretient_12 = Ingredient.create(name: "corn", category: "grains")
ingretient_13 = Ingredient.create(name: "oats", category: "grains")
ingretient_14 = Ingredient.create(name: "rice", category: "grains")
ingretient_15 = Ingredient.create(name: "flour", category: "starch")
ingretient_16 = Ingredient.create(name: "potatos", category: "vegetables")
ingretient_17 = Ingredient.create(name: "raspberry", category: "fruits")
ingretient_18 = Ingredient.create(name: "strawberry", category: "fruits")
ingretient_19 = Ingredient.create(name: "blueberry", category: "fruits")
ingretient_20 = Ingredient.create(name: "mangos", category: "fruits")
ingretient_21 = Ingredient.create(name: "avocados", category: "fruits")
ingretient_22 = Ingredient.create(name: "pears", category: "fruits")
ingretient_23 = Ingredient.create(name: "prune", category: "fruits")
ingretient_24 = Ingredient.create(name: "cucumber", category: "fruits")
ingretient_25 = Ingredient.create(name: "squash", category: "fruits")
ingretient_26 = Ingredient.create(name: "milk", category: "dairy")
ingretient_27 = Ingredient.create(name: "yogurt", category: "dairy")
ingretient_28 = Ingredient.create(name: "butter", category: "dairy")
ingretient_29 = Ingredient.create(name: "kale", category: "vegatbles")
ingretient_30 = Ingredient.create(name: "lettuce", category: "vegetables")
ingretient_31 = Ingredient.create(name: "brocolli", category: "vegtables")
ingretient_32 = Ingredient.create(name: "asparagus", category: "vegetables")
ingretient_33 = Ingredient.create(name: "carrots", category: "vegetables")
ingretient_34 = Ingredient.create(name: "sweet potato", category: "vegetables")
ingretient_35 = Ingredient.create(name: "spinach", category: "vegetables")
ingretient_36 = Ingredient.create(name: "parsnip", category: "vegetables")
ingretient_37 = Ingredient.create(name: "radishes", category: "vegetables")
ingretient_38 = Ingredient.create(name: "cauliflower", category: "vegetables")
ingretient_39 = Ingredient.create(name: "grean beans", category: "vegetables")
ingretient_40 = Ingredient.create(name: "brussel sprouts", category: "vegetables")
ingretient_41 = Ingredient.create(name: "celery", category: "vegetables")
ingretient_42 = Ingredient.create(name: "cherry tomatoes", category: "vegetables")
ingretient_43 = Ingredient.create(name: "rutabaga", category: "vegetables")
ingretient_44 = Ingredient.create(name: "arugula", category: "vegetables")
ingretient_45 = Ingredient.create(name: "bok choy", category: "vegetables")
ingretient_46 = Ingredient.create(name: "endive", category: "vegetables")
ingretient_47 = Ingredient.create(name: "scallion", category: "vegetables")
ingretient_48 = Ingredient.create(name: "okra", category: "vegetables")
ingretient_49 = Ingredient.create(name: "pcollard greens", category: "vegetables")
ingretient_50 = Ingredient.create(name: "watercress", category: "vegetables")
ingretient_51 = Ingredient.create(name: "beets", category: "vegetables")
ingretient_52 = Ingredient.create(name: "parsnip", category: "fruits")
ingretient_53 = Ingredient.create(name: "parsnips", category: "fruits")
ingretient_54 = Ingredient.create(name: "peaches", category: "fruits")
ingretient_55 = Ingredient.create(name: "kiwi", category: "fruits")
ingretient_56 = Ingredient.create(name: "dates", category: "fruits")
ingretient_57 = Ingredient.create(name: "oranges", category: "fruits")
ingretient_58 = Ingredient.create(name: "cherries", category: "fruits")
ingretient_59 = Ingredient.create(name: "grapes", category: "fruits")
ingretient_60 = Ingredient.create(name: "pineapples", category: "fruits")
ingretient_61 = Ingredient.create(name: "nectarines", category: "fruits")
ingretient_62 = Ingredient.create(name: "figs", category: "fruits")
ingretient_63 = Ingredient.create(name: "ginger", category: "spice")
ingretient_64 = Ingredient.create(name: "quinoa", category: "grain")
ingretient_65 = Ingredient.create(name: "wild rice", category: "grain")
ingretient_66 = Ingredient.create(name: "quinoa", category: "grain")
ingretient_67 = Ingredient.create(name: "barley", category: "grain")
ingretient_68 = Ingredient.create(name: "cornmeal", category: "grain")
ingretient_69 = Ingredient.create(name: "peanuts", category: "nuts and seeds")
ingretient_70 = Ingredient.create(name: "almonds", category: "nuts and seeds")
ingretient_71 = Ingredient.create(name: "walnuts", category: "nuts and seeds")
ingretient_72 = Ingredient.create(name: "cashews", category: "nuts and seeds")
ingretient_73 = Ingredient.create(name: "pecans", category: "nuts and seeds")
ingretient_74 = Ingredient.create(name: "pine nuts", category: "nuts and seeds")
ingretient_75 = Ingredient.create(name: "sesame seeds", category: "nuts and seeds")
ingretient_76 = Ingredient.create(name: "chia seeds", category: "nuts and seeds")
ingretient_77 = Ingredient.create(name: "pumkin seeds", category: "nuts and seeds")
ingretient_78 = Ingredient.create(name: "coconut", category: "nuts and seeds")
ingretient_79 = Ingredient.create(name: "poppy seeds", category: "nuts and seeds")
ingretient_80 = Ingredient.create(name: "hazelnuts", category: "nuts and seeds")
ingretient_81 = Ingredient.create(name: "sunflower seeds", category: "nuts and seeds")
ingretient_82 = Ingredient.create(name: "cacao nibs", category: "nuts and seeds")
ingretient_83 = Ingredient.create(name: "hemp seeds", category: "nuts and seeds")
ingretient_84 = Ingredient.create(name: "macadamia nuts", category: "nuts and seeds")
ingretient_85 = Ingredient.create(name: "edamame", category: "legumes")
ingretient_86 = Ingredient.create(name: "lima beans", category: "legumes")
ingretient_87 = Ingredient.create(name: "peas", category: "legumes")
ingretient_88 = Ingredient.create(name: "lentil", category: "legumes")
ingretient_89 = Ingredient.create(name: "chickpea", category: "legumes")
ingretient_90 = Ingredient.create(name: "garbanzo beans ", category: "legumes")
ingretient_91 = Ingredient.create(name: "kidney beans", category: "legumes")
ingretient_92 = Ingredient.create(name: "butter beans", category: "legumes")
ingretient_93 = Ingredient.create(name: "split peas", category: "legumes")
ingretient_94 = Ingredient.create(name: "alfalfa sprouts", category: "legumes")
ingretient_95 = Ingredient.create(name: "mung beans", category: "legumes")
ingretient_96 = Ingredient.create(name: "pinto beans", category: "legumes")
ingretient_97 = Ingredient.create(name: "pea shoots", category: "legumes")
ingretient_98 = Ingredient.create(name: "lychee", category: "fruits")
ingretient_99 = Ingredient.create(name: "lime", category: "fruits")
ingretient_100 = Ingredient.create(name: "lemon", category: "fruits")




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
