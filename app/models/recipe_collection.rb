class RecipeCollection < ApplicationRecord
  belongs_to :recipe
  belongs_to :collection
end
