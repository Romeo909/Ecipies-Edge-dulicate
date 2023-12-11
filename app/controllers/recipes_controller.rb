class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    # Put a button where you can 'Find recipe with what's left in the fridge'
    # This button should launch the search with the pluck array of ingredient's names, if this params exists
    # So Recipe.search_recipe(pluck_result)
    @recipes = Recipe.search_recipes(params[:query]) if params[:query].present?
    @recipes = Recipe.search_recipes(params[:fridge]) if params[:fridge].present?

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
