class Recipe < ApplicationRecord
  acts_as_favoritable
  has_many :user_recipes
  has_many :recipe_ingredients
  validates :name, :instructions, presence: true
end
