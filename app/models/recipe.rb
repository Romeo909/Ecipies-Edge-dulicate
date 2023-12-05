class Recipe < ApplicationRecord
  has_many :user_recipes, :recipe_ingredients
end
