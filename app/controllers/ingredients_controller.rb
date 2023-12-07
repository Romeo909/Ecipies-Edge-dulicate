class IngredientsController < ApplicationController

  def index
    if params[:query].present?
      @ingredients = Ingredient.search_ingredient_in_db(params[:query])
    else
      @ingredients = Ingredient.all
    end
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
