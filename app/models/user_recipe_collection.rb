class UserRecipeCollection < ApplicationRecord
  belongs_to :collection
  belongs_to :user_recipe
end
