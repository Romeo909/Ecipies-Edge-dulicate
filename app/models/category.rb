class Category < ApplicationRecord
  has_many :ingredients, dependent: :destroy
end
