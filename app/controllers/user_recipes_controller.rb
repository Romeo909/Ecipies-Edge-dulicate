class UserRecipesController < ApplicationController
  def index
    @user_recipe = Recipe.new
  end

  def show
    @user_recipe = UserRecipe.find(params[:id])
  end

  def create
    @user_recipe = UserRecipe.new(user_recipe_params)
    @user_recipe.user = current_user
    @user_recipe.recipe = Recipe.find(params[:recipe_id])
    if @user_recipe.save
      if params[:user_recipe][:collection_ids].present?
        params[:user_recipe][:collection_ids].each do |id|
          UserRecipeCollection.create!(user_recipe: @user_recipe, collection: Collection.find(id)) if id != ""
        end
      end
      redirect_to recipe_path(params[:recipe_id]), notice: 'Recipe was added to your cookbook.'
    else
      redirect_to recipe_path(params[:recipe_id]), notice: 'This recipe is already in your cookbook.'
    end
  end

  def destroy
    @user_recipe = UserRecipe.find(params[:id])
    @user_recipe.destroy
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
    params.require(:user_recipe).permit(collection_ids: [])
  end
end
