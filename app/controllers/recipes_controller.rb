class RecipesController < ApplicationController
  def index
    if params[:query]
      @recipes = Recipe.search_recipe(params[:query])
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
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
