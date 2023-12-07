class Recipe < ApplicationRecord
  # acts_as_favoritable
  has_one_attached :image
  has_many :user_recipes, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  validates :name, :instructions, presence: true

  include PgSearch::Model
  pg_search_scope :search_recipe,
                  against: %i[name instructions name],
                  using: {
                    tsearch: { prefix: true, dictionary: "english", any_word: true }
                  }
end
