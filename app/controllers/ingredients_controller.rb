class IngredientsController < ApplicationController

  def index
    # @path = ingredients_path
    if params[:query].present?
      @ingredients = Ingredient.search_ingredient_in_db(params[:query])
    else
      @ingredients = []
    end
    @user_ingredient_ids = UserIngredient.where(user: current_user).pluck(:ingredient_id)
    # these variable down here should exclude the ingredient with an id included in @user_ingredient_ids
    @vegetables = Ingredient.where(category: "vegetables")
    @fruits = Ingredient.where(category: "fruits")
    @starch = Ingredient.where(category: "starch")
    @legumes = Ingredient.where(category: "legumes")
    @flour = Ingredient.where(category: "flour")
    @mushrooms = Ingredient.where(category: "mushrooms")
    @spices = Ingredient.where(category: "spices")
    # @ = Ingredient.where(category: )
    # @ = Ingredient.where(category: )
    # @ = Ingredient.where(category: )
    # @ = Ingredient.where(category: )
    # @ = Ingredient.where(category: )
    # @ = Ingredient.where(category: )
    # @ = Ingredient.where(category: )

  end

end
