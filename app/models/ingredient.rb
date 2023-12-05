class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :user_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true, uniqueness: { case_sensitive: false, message: "Ingredient already exists" }
end
