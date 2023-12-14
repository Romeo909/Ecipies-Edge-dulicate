require "open-uri"
require 'json'
require 'uri'
require 'net/http'

User.destroy_all
Category.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all
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
category_11 = Category.create!(name: "sweetner")


ingretient_1 = Ingredient.create(name: "eggplant", category: category_1)
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
ingretient_111 = Ingredient.create(name: "olive oil", category: category_9)
ingretient_112 = Ingredient.create(name: "tomato", category: category_1)
ingretient_113 = Ingredient.create(name: "pizza dough", category: category_7)
ingretient_114 = Ingredient.create(name: "olives", category: category_2)
ingretient_115 = Ingredient.create(name: "sugar", category: category_11)
ingretient_116 = Ingredient.create(name: "chocolate", category: category_11)
ingretient_117 = Ingredient.create(name: "honey", category: category_11)



UserIngredient.create!(user: rayane, ingredient: ingretient_1)
UserIngredient.create!(user: romar, ingredient: ingretient_2)
UserIngredient.create!(user: lena, ingredient: ingretient_3)
UserIngredient.create!(user: rayane, ingredient: ingretient_4)
UserIngredient.create!(user: romar, ingredient: ingretient_1)
UserIngredient.create!(user: lena, ingredient: ingretient_2)
UserIngredient.create!(user: rayane, ingredient: ingretient_3)
UserIngredient.create!(user: romar, ingredient: ingretient_4)
UserIngredient.create!(user: lena, ingredient: ingretient_1)

recipe1 = Recipe.new(name: "Pasta", instructions: "Pasta with tomato sauce", servings: 2, cooking_time: 20, ingredients: "spaghetti, red pepper, oignon, tomato sauce")
file = URI.open("https://www.foodandwine.com/thmb/tAS-x_IC4ss1cb9EdDpsr0UExdM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/bucatini-with-mushroom-ragu-dandelion-greens-and-tarragon-FT-RECIPE0421-3a5f0d29f7264f5e9952d4a3a51f5f58.jpg")
recipe1.image.attach(io: file, filename: "nes.png", content_type: "image/png")
# Recipe.create!(name: "Vegetable satay curry", instructions: "This creamy vegan curry is packed with plenty of nutritious veggies, warming ginger and chilli for a healthy meat-free meal", servings: 3, cooking_time: 30)
# Recipe.create!(name: "Chicken & chorizo jambalaya", instructions: "This Creole one-pot is bursting with spicy chorizo, succulent chicken and tender veg. It's quick to make and packed with flavour - the perfect midweek meal", servings: 4, cooking_time: 40)
# Recipe.create!(name: "Pasta dish", instructions: "Pasta with tomato sauce", servings: 2, cooking_time: 20, ingredients: %(spaghetti, red pepper, oignon))
recipe2 = Recipe.create!(name: "Vegetable satay curry", instructions: "Put the coconut milk, curry powder, stock cube, peanut butter and squash in a 3.5ltr slow-cooker. Add 100ml water and mix well.
 Cook on low for 3½-4 hrs until the squash is tender. Stir in the frozen peas for the final 15 mins, then turn off the slow-cooker and tip in the spinach and gently stir through the curry until it has wilted. Stir in the lime juice and taste for seasoning. Serve with rice, if you like.", servings: 3, cooking_time: 30, ingredients: "curry, chickpea, carrot, squash, oinion")
file = URI.open("https://www.theendlessmeal.com/wp-content/uploads/2020/12/Peanut-Curry-3-scaled.jpg")
recipe2.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe3 = Recipe.create!(name: "Vegetarian chicken & chorizo jambalaya", instructions: "Heat a large skillet & drizzle with olive oilsauté bell peppers for 1 minadd Cajun spice and stir
Add rice, water and tomatoes mix to combinebring to a boilreduce heat to simmer and covercook for 15 minMix in Kidney beans and cook 2-3 more minutesserve warm", servings: 4, cooking_time: 40, ingredients: "oyster mushroom, red pepper, onion, gusta vegan sausage")
file = URI.open("https://veganheaven.org/wp-content/uploads/2018/03/Vegan-Jambalaya-with-Beans-6.jpg")
recipe3.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe4 = Recipe.create!(name: "Mexican Casserole", instructions: "Preheat oven to 375 degrees F (190 degrees C). Spray a 9-inch pie pan with non-stick cooking spray.In a saucepan, cook refried beans and onions (to soften them) on medium-high heat for about 5 minutes.
Place one tortilla in the bottom of the greased pan. Spread about 1/3 cup of the bean mixture over it. Layer a few tablespoons of salsa over this. Then, place another tortilla over the salsa, and add more of the bean mixture. Follow the beans with a big handful of cheese, spreading evenly. repeat layers, spreading the ingredients evenly over the tortillas. On the top layer, make sure to use lots of salsa and cheese!
Bake until the cheese is melted, approximately 15 to 20 minutes.", servings: 4, cooking_time: 20, ingredients: "refried beans, salsa, onions, flour tortillas, shredded cheddar")
file = URI.open("https://flavormosaic.com/wp-content/uploads/2021/02/Mexican-Vegetarian-Enchilada-Casserole-14-500x375.jpg")
recipe4.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe5 = Recipe.create!(name: "Chickpea Taco", instructions: "lace chickpeas in a saucepan over medium heat. Add water and taco seasoning. Cook and stir until thoroughly heated, 5 to 7 minutes. Remove from heat. Mash mixture to crush chickpeas.
Divide chickpea filling evenly among taco shells.", servings: 4, cooking_time: 20, ingredients: "chickpeas, taco shells, taco seasoning mix, water")
file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeslsHIoOanzedGX12cs-6cK4iqcPP2PBBTw&usqp=CAU")
recipe5.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe6 = Recipe.create!(name: "Eggplant Pasta", instructions: "Peel and chop the eggplant into cubes. Boil it in slightly salted water for about 5 minutes or steam it for about 10 minutes.
Drizzle a pan with oil and sauté the minced onion for a minute. Add the drained eggplant and sauté for 2-3 minutes more.
Meanwhile, add more salt to the boiling water and toss the pasta in.
Transfer the eggplant and onions to a blender, season with salt and pepper, and add the tablespoons of milk. Blend until you get a smooth cream.
Drain the pasta and mix it with the creamy eggplant sauce. Serve with abundant grated Parmigiano cheese on top.", servings: 8, cooking_time: 40, ingredients: "garlic, eggplant, tomatoes chapped, rigaton pasta, olve oil")
file = URI.open("https://www.foodandwine.com/thmb/w9SxDtPYuLyM-6qfnC9GqWSIedE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/201001-xl-fusilli-with-roasted-eggplant-and-goat-cheese-1a526bcb477341c19c7b7a4b63d4cb29.jpg")
recipe6.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe7 = Recipe.create!(name: "Curried Carrot Soup", instructions: "Sauté the onions.Stir in the spices, carrots, and apples.Add stock and bring to a boil. Then reduce the heat, cover, and simmer.Transfer soup to a blenderReturn the puree back to the pot, season with pepper, and serve. Garnish and ENJOY!", servings: 6, cooking_time: 25, ingredients: "carrot choppe, vegetable broth, onions chopped, curry powder, apples")
file = URI.open("https://s3.amazonaws.com/static.realcaliforniamilk.com/media/recipes_2/real-california-curried-carrot-soup.jpg")
recipe7.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe8 = Recipe.create!(name: "Mediterranean Pesto Pizza", instructions: "Preheat oven to 350 degrees F (175 degrees C).
Spread pesto onto each pita; top with feta cheese, tomatoes, and Kalamata olives. Place each pita onto a baking sheet.
Bake in the preheated oven until cheese is melted, 6 to 8 minutes. ", servings: 6, cooking_time: 25, ingredients: "carrot chopped, vegetable broth, onions chopped, curry powder, olve oil")
file = URI.open("https://www.thissavoryvegan.com/wp-content/uploads/2017/03/Vegan-pesto-pizza-2.jpeg")
recipe8.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe9 = Recipe.create!(name: "Guacamole", instructions: "Mash avocados, lime juice, and salt together in a medium bowl; mix in tomatoes, onion, cilantro, and garlic. Stir in cayenne pepper.Serve immediately, or cover and refrigerate for 1 hour for improved flavor.", servings: 4, cooking_time: 15, ingredients: "avocados, lime, onion, tomatoes, garlic, cilantro")
file = URI.open("https://www.budgetbytes.com/wp-content/uploads/2022/04/Guacamole-close.jpg")
recipe9.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe10 = Recipe.create!(name: "Stuffed Mushrooms", instructions: "These delicious stuffed mushrooms are pretty easy to make and taste just like the ones you'd get in a restaurant!", servings: 4, cooking_time: 20, ingredients: "mushrooms, cream cheese, parmesan, seasoning, oil")
file = URI.open("https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2021/11/Stuffed-Mushrooms-main-1-1.jpg")
recipe10.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe11 = Recipe.create!(name: "Orange and Avocado Salad", instructions: "Whisk the olive oil with the orange juice and add salt and pepper to taste.In a large bowl, add the mixed greens and top with orange segments, avocado, and almond slices.
Drizzle with dressing and add additional salt and pepper to taste, if needed.", servings: 2, cooking_time: 10, ingredients: "avocados, orange, almond, mixed greens, olive oil")
file = URI.open("https://iowagirleats.com/wp-content/uploads/2012/03/DSC_0714_thumb.jpg")
recipe11.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe12 = Recipe.create!(name: "Creamy Goat Cheese Pasta", instructions: "Bring a large pot of water to a boil.Add the pasta to the boiling water. When there are 4 minutes left in the cooking time, add the asparagus to the pot of pasta and cook until the pasta al dente and the asparagus is tender.Reserve 1/2 cup of pasta water and then drain the rest of the water from the pot.
Add the pasta water, olive oil, and goat cheese to the now-empty pot.Cook over low heat, whisking until the cheese is melted and the sauce is smooth.
Add the pasta and asparagus and stir until evenly coated.", servings: 4, cooking_time: 15, ingredients: "pasta, goat cheese, asparagus, olive oil")
file = URI.open("https://iheartvegetables.com/wp-content/uploads/2014/03/Goat-Cheese-Pasta-7-of-8.jpg")
recipe12.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe13 = Recipe.create!(name: "Shaved Brussels Sprouts with Parmesan & Lemon", instructions: "Using a mandoline slicer (or a sharp knife) cut the Brussels sprouts into very thin slices. Discard the ends. You can also buy pre-shredded Brussels sprouts or use a shredding disk of a food processor.In a small dish, combine the olive oil and lemon juice.
Toss the shaved Brussels sprouts with the olive oil and lemon juice.Shred the parmesan cheese on top with a fine cheese grater.Sprinkle with pine nuts or sunflower seeds and a pinch of salt.", servings: 2, cooking_time: 20, ingredients: "brussel sprouts, lemon, pine nuts, olive oil, parmesan")
file = URI.open("https://www.platingsandpairings.com/wp-content/uploads/2018/10/shaved-brussel-sprout-salad-recipe-1-scaled.jpg")
recipe13.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe14 = Recipe.create!(name: "Chocolate Granola Bark", instructions: " Melt the chocolate chips in a microwave safe bowl by cooking on 50% power, stirring every 30 seconds until smooth.
Spread the melted chocolate chips onto a sheet of wax paper or parchment paper.Sprinkle the granola evenly across the chocolate.Top with seeds, coconut flakes, and salt.
Gently press the toppings into the chocolate so they stick, then place it in the fridge for 30 minutes or until set.Crack into bite size pieces and store in an airtight container in the refrigerator.", servings: 6, cooking_time: 5, ingredients: "semi-sweet chocolate, granola, pumkin seeds, coconut flakes")
file = URI.open("https://iheartvegetables.com/wp-content/uploads/2017/07/Granola-Bark-3-of-6-680x1020.jpg")
recipe14.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe15 = Recipe.create!(name: "Potato Soup", instructions: "Fill a large pot of water with just enough water to cover the potatoes and bring it to a boil.
  Reduce the heat to a simmer and continue to cook the potatoes for about 15-20 minutes until soft. When poked with a fork, the potato should mostly fall apart.
  Remove from heat and drain most of the water, from the pot, leaving just a half-inch of water at the bottom of the pot. (This doesn’t have to be exact so don’t stress!)
  Add the milk garlic salt and pepper, then gently mash the potatoes with the back of a fork until the potatoes start to break down. I like my soup chunky, but if you like it smoother, you could use a potato masher or an immersion blender.Continue to cook on low heat for 5 minutes.Divide into bowls and top each bowl with a little cheese, green onions, and additional salt and pepper to taste", servings: 8, cooking_time: 30, ingredients: "potatoes, milk, cheddar cheese, garlic")
file = URI.open("https://www.budgetbytes.com/wp-content/uploads/2023/11/Slow-Cooker-Potato-Soup-Close.jpg")
recipe15.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe16 = Recipe.create!(name: "Black Bean Soup", instructions: "In a large pot, add in your black beans, including the liquid in the can.
Add the tomatoes and salsa, cumin, and chili powder.Cook over low heat for 10-15 minutes, then remove from heat and let cool slightly before serving.When ready to serve, top with sliced avocado or a sprinkle of fresh cilantro, if you’re using additional toppings!", servings: 2, cooking_time: 15, ingredients: ["black beans", "tomatoes", "salsa", "cumin", "fresh cilantro"])
file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVBO5P-iHCqWWAfJczFInZoyfGUden3LG7uQ&usqp=CAU")
recipe16.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe17 = Recipe.create!(name: "Baked Eggs in Tomato Sauce with Kale", instructions: "Preheat oven to 350 degrees F.
Heat oil in a 10-inch cast-iron skillet or nonstick ovenproof skillet over medium heat. Add kale, season with 1/4 teaspoon salt and 1/8 teaspoon pepper, and sauté for 2 minutes. Stir in marinara (or tomato) sauce and bring to a simmer.
Make 8 wells in the sauce with the back of a spoon and carefully crack an egg into each well. Season the eggs with the remaining 1/4 teaspoon salt and 1/8 teaspoon pepper.
Transfer the pan to the oven and bake until the egg whites are set and the yolks are still soft, about 20 minutes.", servings: 2, cooking_time: 15, ingredients: "eggs, marinara sauce, kale, olive oil, salt, pepper")
file = URI.open("https://www.eatingwell.com/thmb/K09Abke0bp7cDnJZmMED_r7cqxU=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/5340730-1ae0447154a64d9db31e946fb6f4d78e.jpg")
recipe17.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe18 = Recipe.create!(name: "Sheet-Pan Caprese Pizza", instructions: "Place a 17- x 12-inch baking sheet in oven; preheat oven to 450 degrees F. Stretch pizza dough into a 15- x 10-inch rectangle on a large sheet of parchment paper. Brush dough evenly with oil; sprinkle with 1/2 teaspoon of the salt and 1/4 teaspoon of the pepper. Transfer to hot baking sheet in preheated oven. Bake until crust starts to brown, about 10 minutes.
  Remove from oven; top evenly with cheese and tomatoes. Return to oven; bake at 450 degrees F until cheese just melts, about 2 minutes.
  Remove from oven. Sprinkle with basil and remaining 1/4 teaspoon each salt and pepper; drizzle with glaze. Slice into 6 pieces.", servings: 2, cooking_time: 15, ingredients: "baby heirloom tomates, basil, mozzarella, balsamic glaze, pizza dough")
file = URI.open("https://www.eatingwell.com/thmb/lhjs3JMYKFAmL2bSoCHyjBsWjKc=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/6974157-a02e017c536c4e5d8d9a54671571bfff.jpg")
recipe18.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe19 = Recipe.create!(name: "White Bean & Pesto Risotto", instructions: "Preheat oven to 425°F and coat a large rimmed baking sheet lightly with olive oil.
  Prepare risotto according to package directions.
  Meanwhile, toss beans with oil, salt and pepper and spread out on the prepared pan. Roast, stirring once halfway through, until lightly browned, about 20 minutes.
  Divide the cooked risotto among 4 bowls. Top with roasted beans and drizzle with pesto.", servings: 2, cooking_time: 15, ingredients: "arborio rice, white beans, pesto")
file = URI.open("https://www.eatingwell.com/thmb/SJu8Ht5qcD4c3o9IMyj7LusfWcs=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/risotto2-2-37c47042b6fb480fb1c0d9403afe14ac.jpg")
recipe19.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe20 = Recipe.create!(name: "Cauliflower Gnocchi with Asparagus & Pesto", instructions: "Heat oil in a large nonstick skillet over medium heat. Add gnocchi and cook, stirring frequently, until heated through and golden brown, 6 to 8 minutes.
Meanwhile, place asparagus in a microwave-safe dish and add 1/4 inch of water. Cover tightly and microwave on High until crisp-tender and bright green, about 2 minutes. Drain and cut into 1-inch pieces.
Add the asparagus and pesto to the gnocchi and toss to combine.", servings: 2, cooking_time: 15, ingredients: "cauliflower gnocchi, asparagus, basil, pesto, olive oli")
file = URI.open("https://www.eatingwell.com/thmb/asmp3wYiakUxze5tnKyEgIcKIPE=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/cauliflower-gnocchi-with-asparagus-and-pesto-3e489e08fc6e48eea009294387e91592.jpeg")
recipe20.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe21 = Recipe.create!(name: "Teriyaki Edamame Sauté", instructions: "Heat oil in a large nonstick skillet over medium heat. Add coleslaw mix and cook, stirring, until the cabbage begins to soften, about 2 minutes. Stir in edamame and teriyaki sauce. Cook, stirring, until the edamame are heated through and the sauce thickens, about 1 minute more.", servings: 2, cooking_time: 15, ingredients: "teriyaki sauce, edamame, cabbage, carrot, olive oil")
file = URI.open("https://www.eatingwell.com/thmb/7zfnYf7GDbgr4iyQnrt-zdU8kXA=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/EW-3-Ingredient-Dinners-for-Diabetes_Teriyaki-Edamame-Saute-06e5cf454b5f42c5a459d83e69fcd5ad.jpg")
recipe21.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe22 = Recipe.create!(name: "Stuffed Potatoes with Salsa & Beans", instructions: "Pierce potatoes all over with a fork. Microwave on Medium, turning once or twice, until soft, about 20 minutes. (Alternatively, bake potatoes at 425 degrees F until tender, 45 minutes to 1 hour.) Transfer to a clean cutting board and let cool slightly.
Holding them with a kitchen towel to protect your hands, make a lengthwise cut to open the potato, but don't cut all the way through. Pinch the ends to expose the flesh.
Top each potato with some salsa, avocado, beans and jalapeños. Serve warm.", servings: 2, cooking_time: 15, ingredients: "russet potato, salsa, avocada, pinto beans, jalapenos")
file = URI.open("https://www.eatingwell.com/thmb/0MaNOpe7Gv5Zwir39XTD95ChBWU=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/7012358-8204ce7aa8774da8be9559c39a56ebee.jpg")
recipe22.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe22 = Recipe.create!(name: "Egg Drop Soup with Instant Noodles, Spinach & Scallions", instructions: "
Bring water to a boil in a small saucepan. Stir in half of the seasoning packet (discard the remainder or reserve for another use). Add noodles and cook until tender, about 3 minutes. Reduce heat to maintain a simmer.
Whisk egg in a small bowl. Slowly pour the egg into the simmering soup, stirring constantly. Fold in spinach until just wilted, about 30 seconds. Transfer to a bowl and sprinkle with scallion.", servings: 2, cooking_time: 15, ingredients: "spinach,rice nooodles, egg, scallion")
file = URI.open("https://www.eatingwell.com/thmb/TGQd4RbfVhcdzSQv5YjWUc8Hsk0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8309319-15065462bbf74d019c7c0f35bbf67526.jpg")
recipe22.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe22 = Recipe.create!(name: "Grilled Pizza with Summer Squash, Feta & Basil", instructions: "Preheat grill to medium-high.
Roll dough into a 12-inch oval on a lightly floured surface. Transfer to a lightly floured large baking sheet. Bring the dough, hummus, squash and feta to the grill.
Oil the grill rack. Transfer the crust to the grill. Close the lid and cook until puffed and lightly browned, 1 to 2 minutes. Using tongs, turn the crust over. Spread the crust with the hummus and top with the squash and the feta. Close the lid and cook until the cheese is melted and the crust is lightly browned on the bottom, 2 to 3 minutes more.
Return the pizza to the baking sheet. Top with basil and pepper, if desired.", servings: 2, cooking_time: 15, ingredients: "squash, redpepper hummus, feta cheese, pizza dough")
file = URI.open("https://www.eatingwell.com/thmb/sHT7T5EFFAl04sm7bQUopsJVXGU=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/5492806-a74fc586c1d6464fa5c99d3037e43c07.jpg")
recipe22.image.attach(io: file, filename: "nes.png", content_type: "image/png")
recipe22 = Recipe.create!(name: "Goat Cheese Pasta with Broccoli", instructions: "Cook pasta according to package directions; drain, reserving ½ cup cooking water.
  Return the drained pasta to the pot and add goat cheese. Stir until the cheese melts and coats the pasta, adding the reserved pasta water as needed to make a thin sauce.
  Fold in broccoli. Season to taste with salt and pepper, if desired.", servings: 2, cooking_time: 15, ingredients: "pasta, cream cheese, garlic, broccoli")
file = URI.open("https://www.eatingwell.com/thmb/MzCeDXdqiXl2RFRoBkdjafrnfcA=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/goat-cheese-pasta-broc-5d189a287959471389195cb6f6a5dfae.jpg")
recipe22.image.attach(io: file, filename: "nes.png", content_type: "image/png")


# Recipe.create!(name: "Vegetable satay curry", instructions: "This creamy vegan curry is packed with plenty of nutritious veggies, warming ginger and chilli for a healthy meat-free meal", servings: 3, cooking_time: 30, ingredients: %(curry, carrot, onion))

# Recipe.create!(name: "Pasta", instructions: "Pasta with tomato sauce", servings: 2, cooking_time: 20, ingredients: %(spaghetti, red pepper, onion))
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
