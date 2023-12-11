class UserRecipesController < ApplicationController
  def index
    @user_recipes = UserRecipe.where(user: current_user)
  end

  def show
    @user_recipe = UserRecipe.find(params[:id])
    @recipe = user_recipe.recipe
  end

  def new
    @user_recipe = UserRecipe.new
    # @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @user_recipe = UserRecipe.new(user_recipe_params)
    # Userd to be Recipe.new
    @user_recipe.user = current_user
    @user_recipe.recipe = Recipe.find(params[:recipe_id])

    if @user_recipe.save
      redirect_to root_path, notice: 'Recipe was added to your cookbook.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user_recipe = UserRecipe.find(params[:id])
  end

  def update
    @user_recipe = UserRecipe.update(user_recipe_params)
    redirect_to root_path
  end

  private

  def user_recipe_params
    params.permit(:recipe_id, collection_ids: [])
  end
end
