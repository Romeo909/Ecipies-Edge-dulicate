class Recipe < ApplicationRecord
  has_many :user_recipes, :recipe_ingredients
  validates :name, :instructions, presence: true
end
