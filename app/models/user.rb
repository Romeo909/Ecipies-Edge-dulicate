class User < ApplicationRecord
  # acts_as_favoritor
  has_many :user_recipies
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients
  has_many :recipes, through: :user_recipes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
