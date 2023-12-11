class Collection < ApplicationRecord
  belongs_to :user
  has_many :recipe_collections, dependent: :destroy

  validates :name, presence: true
end
