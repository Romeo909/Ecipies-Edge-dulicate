class IngredientsController < ApplicationController

  def index
    if params[:query].present?
      @ingredients = Ingredient.search_ingredient_in_db(params[:query])
    else
      @ingredients = Ingredient.all
    end
    @user_ingredient_ids = UserIngredient.where(user: current_user).pluck(:ingredient_id)

    @categories = Category.all
  end

end
