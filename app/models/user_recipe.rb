class UserRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  has_many :user_recipe_collections, dependent: :destroy
  has_many :collections, through: :user_recipe_collections
end
