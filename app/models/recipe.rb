class Recipe < ApplicationRecord
  # acts_as_favoritable
  has_one_attached :image
  has_many :user_recipes, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  # In the schema, we don't have any :recipe_collection. So I commented the following line and modified the second.
  # has_many :recipe_collections, dependent: :destroy
  # has_many :collections, through: :recipe_collections
  has_many :user_recipe_collections, through: :user_recipes
  validates :name, :instructions, presence: true

  include PgSearch::Model
  pg_search_scope :search_recipes,
                  against: %i[name instructions],
                  using: {
                    tsearch: { prefix: true, any_word: true }
                  }
end
