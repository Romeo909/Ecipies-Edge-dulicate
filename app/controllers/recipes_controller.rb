class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    # Fetch ingredients list
    ingredients_id = UserIngredient.where(user: current_user).pluck(:ingredient_id)
    # Without the pluck, I would only get an array of user_ingredients instances
    @ingredients_name = Ingredient.find(ingredients_id).pluck(:name).join(' ')

    # Put a button where you can 'Find recipe with what's left in the fridge'
    # This button should launch the search with the pluck array of ingredient's names, if this params exists
    # So Recipe.search_recipe(pluck_result)
    @recipes = Recipe.search_recipes(@ingredients_name) if params[:fridge].present?

    @recipes = Recipe.search_recipes(params[:query]) if params[:query].present?

    respond_to do |format|
      format.html
      format.text { render partial: 'list', locals: { recipes: @recipes }, formats: [:html] }
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user_recipe = UserRecipe.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe.save
  end
end
