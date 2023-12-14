class IngredientsController < ApplicationController

  def index
    if params[:query].present?
      @ingredients = Ingredient.search_ingredient_in_db(params[:query])
    else
      @ingredients = Ingredient.all
    end
    @user_ingredient_ids = UserIngredient.where(user: current_user).pluck(:ingredient_id)
    category_ids = @ingredients.pluck(:category_id)
    @categories = Category.find(category_ids)
  end

end
