class Recipe < ApplicationRecord
  # acts_as_favoritable
  has_one_attached :image
  has_many :user_recipes, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
<<<<<<< HEAD
  has_many :recipe_collections, dependent: :destroy
  has_many :collections, through: :recipe_collections
  validates :instructions, presence: true
  validates :name, uniqueness: { scope: :user }
=======
  # In the schema, we don't have any :recipe_collection. So I commented the following line and modified the second.
  # has_many :recipe_collections, dependent: :destroy
  # has_many :collections, through: :recipe_collections
  has_many :user_recipe_collections, through: :user_recipes
  validates :name, :instructions, presence: true
>>>>>>> 3b1244eb3d01537a633b390b5e807c50693f5cf4

  belongs_to :user, optional: true
  include PgSearch::Model
  pg_search_scope :search_recipes,
                  against: %i[name instructions],
                  using: {
                    tsearch: { prefix: true, any_word: true }
                  }
end
