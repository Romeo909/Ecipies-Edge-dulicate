class UserRecipesController < ApplicationController
  def index
    @user_recipes = UserRecipe.where(user: current_user)
  end

  def show
    user_recipe = UserRecipe.find(params[:id])
    @recipe = user_recipe.recipe
  end

  def new
    @recipe = Recipe.new
  end

  def create
    raise
    @user_recipe = Recipe.new(user_recipe_params)
    @user_recipe.user = current_user
    @user_recipe.recipe = Recipe.find(params[:recipe_id])

    if @user_recipe.save
      redirect_to root_path, notice: 'Recipe was added to your recipes.'
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
    params.require(:user_recipe).permit(:label, :notes, :recipe_id)
  end
end
