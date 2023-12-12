class Ingredient < ApplicationRecord
  belongs_to :category
  has_many :recipe_ingredients, dependent: :destroy
  has_many :user_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true, uniqueness: { case_sensitive: false, message: "Ingredient already exists" }

  include PgSearch::Model
  pg_search_scope :search_ingredient_in_db,
                  against: [:name],
                  using: {
                    tsearch: { dictionary: "english",
                               prefix: true } # <-- non-completed word will return something!
                  }
end
