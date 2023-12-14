class Recipe < ApplicationRecord
  # acts_as_favoritable
  has_one_attached :image
  has_many :user_recipes, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  validates :instructions, presence: true
  validates :name, presence: true, uniqueness: { scope: :user }
  validates :ingredients, presence: true

  belongs_to :user, optional: true
  include PgSearch::Model
  pg_search_scope :search_recipes_with_fridge,
                  against: %i[name ingredients],
                  using: {
                    tsearch: { any_word: true }
                  }
  pg_search_scope :search_recipes_with_query,
                  against: %i[name ingredients instructions],
                  using: {
                    tsearch: { prefix: true}
                  }
end
