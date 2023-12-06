class Recipe < ApplicationRecord
  # acts_as_favoritable
  has_many :user_recipes, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  validates :name, :instructions, presence: true
end
