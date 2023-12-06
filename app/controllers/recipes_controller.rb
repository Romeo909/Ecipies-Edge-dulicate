class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipes = Recipe.find(params[:id])
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
