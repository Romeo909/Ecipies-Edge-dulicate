class UserRecipeCollection < ApplicationRecord
  belongs_to :collection
  belongs_to :user_recipe

  validates :collection, uniqueness: { scope: :user_recipe }
end
