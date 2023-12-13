require "open-uri"
require 'json'
require 'uri'
require 'net/http'

RecipeIngredient.destroy_all
Recipe.destroy_all
UserIngredient.destroy_all
Ingredient.destroy_all
Category.destroy_all
User.destroy_all

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

category_1 = Category.create!(name: "vegetables")
category_2 = Category.create!(name: "fruits")
category_3 = Category.create!(name: "starch")
category_4 = Category.create!(name: "legumes")
category_5 = Category.create!(name: "grains")
category_6 = Category.create!(name: "dairy")
category_7 = Category.create!(name: "flour")
# category_8 = Category.create!(name: "mushrooms")
category_9 = Category.create!(name: "herbs & spices")
# Category.create!(name: "meat substitute")
category_10 = Category.create!(name: "nuts and seeds")


ingretient_1 = Ingredient.create(name: "aubergine", category: category_1)
ingretient_2 = Ingredient.create(name: "onion", category: category_1)
ingretient_3 = Ingredient.create(name: "red pepper", category: category_1)
ingretient_4 = Ingredient.create(name: "spaghetti", category: category_3)
ingretient_5 = Ingredient.create(name: "curry", category: category_9)
ingretient_6 = Ingredient.create(name: "cloves garlic", category: category_1)
ingretient_7 = Ingredient.create(name: "zucchini", category: category_1)
ingretient_8 = Ingredient.create(name: "macaroni", category: category_3)
ingretient_9 = Ingredient.create(name: "carrot", category: category_1)
ingretient_10 = Ingredient.create(name: "oyster mushroom", category: category_1)
# ingretient_11 = Ingredient.create(name: "gusta vegan sausage", category: 9)
ingretient_12 = Ingredient.create(name: "corn", category: category_5)
ingretient_13 = Ingredient.create(name: "oats", category: category_5)
ingretient_14 = Ingredient.create(name: "rice", category: category_3)
ingretient_15 = Ingredient.create(name: "whole wheat flour", category: category_7)
ingretient_16 = Ingredient.create(name: "potatos", category: category_1)
ingretient_17 = Ingredient.create(name: "raspberry", category: category_2)
ingretient_18 = Ingredient.create(name: "strawberry", category: category_2)
ingretient_19 = Ingredient.create(name: "blueberry", category: category_2)
ingretient_20 = Ingredient.create(name: "mangos", category: category_2)
ingretient_21 = Ingredient.create(name: "avocados", category: category_2)
ingretient_22 = Ingredient.create(name: "pears", category: category_2)
ingretient_23 = Ingredient.create(name: "prune", category: category_2)
ingretient_24 = Ingredient.create(name: "cucumber", category: category_1)
ingretient_25 = Ingredient.create(name: "squash", category: category_2)
ingretient_26 = Ingredient.create(name: "milk", category: category_6)
ingretient_27 = Ingredient.create(name: "yogurt", category: category_6)
ingretient_28 = Ingredient.create(name: "butter", category: category_6)
ingretient_29 = Ingredient.create(name: "kale", category: category_1)
ingretient_30 = Ingredient.create(name: "lettuce", category: category_1)
ingretient_31 = Ingredient.create(name: "brocolli", category: category_1)
ingretient_32 = Ingredient.create(name: "asparagus", category: category_1)
ingretient_33 = Ingredient.create(name: "carrots", category: category_1)
ingretient_34 = Ingredient.create(name: "sweet potato", category: category_1)
ingretient_35 = Ingredient.create(name: "spinach", category: category_1)
ingretient_36 = Ingredient.create(name: "parsnip", category: category_1)
ingretient_37 = Ingredient.create(name: "radishes", category: category_1)
ingretient_38 = Ingredient.create(name: "cauliflower", category: category_1)
ingretient_39 = Ingredient.create(name: "grean beans", category: category_1)
ingretient_40 = Ingredient.create(name: "brussel sprouts", category: category_1)
ingretient_41 = Ingredient.create(name: "celery", category: category_1)
ingretient_42 = Ingredient.create(name: "cherry tomatoes", category: category_1)
ingretient_43 = Ingredient.create(name: "rutabaga", category: category_1)
ingretient_44 = Ingredient.create(name: "arugula", category: category_1)
ingretient_45 = Ingredient.create(name: "bok choy", category: category_1)
ingretient_46 = Ingredient.create(name: "endive", category: category_1)
ingretient_47 = Ingredient.create(name: "scallion", category: category_1)
ingretient_48 = Ingredient.create(name: "okra", category: category_1)
ingretient_49 = Ingredient.create(name: "pcollard greens", category: category_1)
ingretient_50 = Ingredient.create(name: "watercress", category: category_1)
ingretient_51 = Ingredient.create(name: "beets", category: category_1)
ingretient_52 = Ingredient.create(name: "parsnip", category: category_2)
ingretient_53 = Ingredient.create(name: "parsnips", category: category_2)
ingretient_54 = Ingredient.create(name: "peaches", category: category_2)
ingretient_55 = Ingredient.create(name: "kiwi", category: category_2)
ingretient_56 = Ingredient.create(name: "dates", category: category_2)
ingretient_57 = Ingredient.create(name: "oranges", category: category_2)
ingretient_58 = Ingredient.create(name: "cherries", category: category_2)
ingretient_59 = Ingredient.create(name: "grapes", category: category_2)
ingretient_60 = Ingredient.create(name: "pineapples", category: category_2)
ingretient_61 = Ingredient.create(name: "nectarines", category: category_2)
ingretient_62 = Ingredient.create(name: "figs", category: category_2)
ingretient_63 = Ingredient.create(name: "ginger", category: category_9)
ingretient_64 = Ingredient.create(name: "quinoa", category: category_5)
ingretient_65 = Ingredient.create(name: "wild rice", category: category_5)
ingretient_66 = Ingredient.create(name: "quinoa", category: category_5)
ingretient_67 = Ingredient.create(name: "barley", category: category_5)
ingretient_68 = Ingredient.create(name: "cornmeal", category: category_5)
ingretient_69 = Ingredient.create(name: "peanuts", category: category_10)
ingretient_70 = Ingredient.create(name: "almonds", category: category_10)
ingretient_71 = Ingredient.create(name: "walnuts", category: category_10)
ingretient_72 = Ingredient.create(name: "cashews", category: category_10)
ingretient_73 = Ingredient.create(name: "pecans", category: category_10)
ingretient_74 = Ingredient.create(name: "pine nuts", category: category_10)
ingretient_75 = Ingredient.create(name: "sesame seeds", category: category_10)
ingretient_76 = Ingredient.create(name: "chia seeds", category: category_10)
ingretient_77 = Ingredient.create(name: "pumkin seeds", category: category_10)
ingretient_78 = Ingredient.create(name: "coconut", category: category_10)
ingretient_79 = Ingredient.create(name: "poppy seeds", category: category_10)
ingretient_80 = Ingredient.create(name: "hazelnuts", category: category_10)
ingretient_81 = Ingredient.create(name: "sunflower seeds", category: category_10)
ingretient_82 = Ingredient.create(name: "cacao nibs", category: category_10)
ingretient_83 = Ingredient.create(name: "hemp seeds", category: category_10)
ingretient_84 = Ingredient.create(name: "macadamia nuts", category: category_10)
ingretient_85 = Ingredient.create(name: "edamame", category: category_4)
ingretient_86 = Ingredient.create(name: "lima beans", category: category_4)
ingretient_87 = Ingredient.create(name: "peas", category: category_4)
ingretient_88 = Ingredient.create(name: "lentil", category: category_4)
ingretient_89 = Ingredient.create(name: "chickpea", category: category_4)
ingretient_90 = Ingredient.create(name: "garbanzo beans ", category: category_4)
ingretient_91 = Ingredient.create(name: "kidney beans", category: category_4)
ingretient_92 = Ingredient.create(name: "butter beans", category: category_4)
ingretient_93 = Ingredient.create(name: "split peas", category: category_4)
ingretient_94 = Ingredient.create(name: "alfalfa sprouts", category: category_4)
ingretient_95 = Ingredient.create(name: "mung beans", category: category_4)
ingretient_96 = Ingredient.create(name: "pinto beans", category: category_4)
ingretient_97 = Ingredient.create(name: "pea shoots", category: category_4)
ingretient_98 = Ingredient.create(name: "lychee", category: category_2)
ingretient_99 = Ingredient.create(name: "lime", category: category_2)
ingretient_100 = Ingredient.create(name: "lemon", category: category_2)
ingretient_101 = Ingredient.create(name: "rice flour", category: category_7)
ingretient_102 = Ingredient.create(name: "all purpose flour", category: category_7)
ingretient_103 = Ingredient.create(name: "almond flour", category: category_7)
ingretient_104 = Ingredient.create(name: "paprika", category: category_9)
ingretient_105 = Ingredient.create(name: "romarin", category: category_9)
ingretient_106 = Ingredient.create(name: "thym", category: category_9)
ingretient_107 = Ingredient.create(name: "salt", category: category_9)
ingretient_108 = Ingredient.create(name: "pepper", category: category_9)
ingretient_109 = Ingredient.create(name: "cumin", category: category_9)
ingretient_110 = Ingredient.create(name: "chilli flakes", category: category_9)



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
Recipe.create!(name: "Mexican Casserole", instructions: "Small dinner pie made with salsa, tortillas, refried beans, cheese, and onions", servings: 4, cooking_time: 20, ingredients: ["refried beans", "salsa", "onions", "flour tortillas", "shredded cheddar"])
Recipe.create!(name: "Chickpea Taco", instructions: "Quick healthy tacos that the kids will go crazy for. Use this mixture as you would taco meat in taco shells or tortillas. Add desired toppings and enjoy!", servings: 4, cooking_time: 20, ingredients: ["chickpeas", "taco shells", "taco seasoning mix", "water"])
Recipe.create!(name: "Eggplant Pasta", instructions: "Easy and quick pasta dish!", servings: 8, cooking_time: 40, ingredients: ["garlic", "eggplant", "tomatoes chapped", "rigaton pasta", "olve oil"])
Recipe.create!(name: "Curried Carrot Soup", instructions: "Quick, easy, and light ", servings: 6, cooking_time: 25, ingredients: ["carrot chopped", "vegetable broth", "onions chopped", "curry powder", "olve oil"])
Recipe.create!(name: "Mediterranean Pesto Pizza", instructions: "Quick, easy, and light ", servings: 6, cooking_time: 25, ingredients: ["carrot chopped", "vegetable broth", "onions chopped", "curry powder", "olve oil"])
Recipe.create!(name: "Guacamole", instructions: "This guacamole recipe gets a tasty kick from cayenne and cilantro", servings: 4, cooking_time: 15, ingredients: ["avocados", "lime", "onion ", "tomatoes", "garlic", "cilantro"])
Recipe.create!(name: "Stuffed Mushrooms", instructions: "These delicious stuffed mushrooms are pretty easy to make and taste just like the ones you'd get in a restaurant!", servings: 4, cooking_time: 20, ingredients: ["mushrooms", "cream cheese", "parmesan ", "seasoning", "oil"])
Recipe.create!(name: "Orange and Avocado Salad", instructions: "This is one of the easiest salads so it’s a great one for a busy weeknight or a quick lunch!", servings: 2, cooking_time: 10, ingredients: ["avocados", "orange", "almond", "mixed greens", "olive oil"])
Recipe.create!(name: "Creamy Goat Cheese Pasta", instructions: "This creamy goat cheese pasta uses a simple sauce with just a few ingredients. It’s a quick and easy dinner idea but you’d never know it from the taste!", servings: 4, cooking_time: 15, ingredients: ["pasta", "goat cheese", "asparagus", "olive oil"])
Recipe.create!(name: "Shaved Brussels Sprouts with Parmesan & Lemon", instructions: "This shaved brussels sprout salad doesn’t require any cooking – you can eat these sprouts raw!", servings: 2, cooking_time: 20, ingredients: ["brussel sprouts", "lemon", "pine nuts ", "olive oil", "parmesan"])
Recipe.create!(name: "Chocolate Granola Bark", instructions: "This chocolate granola bark recipe is an easy dessert that you can make in just 5 minutes! With plenty of substitution options, you’ll be able to make this with the ingredients you already have in your pantry.", servings: 6, cooking_time: 5, ingredients: ["semi-sweet chocolate", "granola", "pumkin seeds ", "coconut flakes" ])
Recipe.create!(name: "Potato Soup", instructions: "This easy potato soup is only 4 ingredients and it’s budget-friendly, too! Try this deliciously creamy potato soup for your next weeknight meal.", servings: 8, cooking_time: 30, ingredients: ["potatoess", "milk", "cheddar cheese", "garlic" ])
Recipe.create!(name: "Black Bean Soup", instructions: "This vegan black bean soup recipe is deliciously spicy", servings: 2, cooking_time: 15, ingredients: ["black beans", "tomatoes", "salsa", "cumin", "fresh cilantro"])

# Recipe.create!(name: "Pasta", instructions: "Pasta with tomato sauce", servings: 2, cooking_time: 20, ingredients: %(spaghetti, red pepper, oignon))
# Recipe.create!(name: "Vegetable satay curry", instructions: "This creamy vegan curry is packed with plenty of nutritious veggies, warming ginger and chilli for a healthy meat-free meal", servings: 3, cooking_time: 30, ingredients: %(curry, carrot, oignon))
# Recipe.create!(name: "Vegetarian chicken & chorizo jambalaya", instructions: "This Creole one-pot is bursting with spicy chorizo, succulent chicken and tender veg. It's quick to make and packed with flavour - try the vegetarian version for the perfect midweek meal", servings: 4, cooking_time: 40, ingredients: ["oyster mushroom", "red pepper", "oignon", "gusta vegan sausage"])


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
