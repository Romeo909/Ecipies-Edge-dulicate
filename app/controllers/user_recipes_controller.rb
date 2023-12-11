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
    raise
    @user_recipe = UserRecipe.new(user_recipe_params)
    @user_recipe.user = current_user
    @user_recipe.recipe = Recipe.find(params[:recipe_id])
    if @user_recipe.save
      if params[:collection_ids].present?
        params[:collection_ids].each do |id|
          recipe_colection = UserRecipeCollection.new(recipe: @user_recipe, collection: Collection.find(id)) if id != ""
          recipe_colection.save
        end
      end
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
    params.require(:user_recipe).permit(:recipe_id, collection_ids: [])
  end
end
