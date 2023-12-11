class Collection < ApplicationRecord
  belongs_to :user
  has_many :recipe_collections, dependent: :destroy
  has_many :user_recipes, through: :user_recipe_collections

  validates :name, presence: true
end
