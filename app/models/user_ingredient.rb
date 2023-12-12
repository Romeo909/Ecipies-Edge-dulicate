class UserIngredient < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient
  has_many :categories, through: :ingredient

  validates :ingredient_id, uniqueness: { scope: :user_id}
end
