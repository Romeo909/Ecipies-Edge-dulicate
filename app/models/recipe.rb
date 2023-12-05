class Recipe < ApplicationRecord
  has_many :user_recipes
  has_many :recipe_ingredients
  validates :name, :instructions, presence: true
end
