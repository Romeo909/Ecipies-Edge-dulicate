class UserRecipesController < ApplicationController
  def index
    @user_recipe = Recipe.new
  end

  def show
    @user_recipe = UserRecipe.find(params[:id])
    # @user_recipe_collection = UserRecipeCollection.new
    # raise
    # Find UserRecipeCollection where this recipe is stored.
    # Find all collections of the current user
    # Pass this collections in the array if they are not equal to the collections find in step 1.
    # Pass these @collections to the modal
  end

  def create
    @user_recipe = UserRecipe.new(user_recipe_params)
    @user_recipe.user = current_user
    @user_recipe.recipe = Recipe.find(params[:recipe_id])
    if @user_recipe.save
      save_to_collections(params[:user_recipe][:collection_ids], @user_recipe)
      save_to_all_collection(@user_recipe)
    else
      save_to_collections(params[:user_recipe][:collection_ids],
                          Recipe.find(params[:recipe_id]).user_recipes.where(user: current_user,
                                                                             recipe: params[:recipe_id])[0])
      save_to_all_collection(Recipe.find(params[:recipe_id]).user_recipes.where(user: current_user,
                                                                                recipe: params[:recipe_id])[0])
    end
    redirect_to recipe_path(params[:recipe_id]), notice: 'Recipe added to your cookbook.'
  end

  def destroy
    @user_recipe = UserRecipe.find(params[:id])
    @user_recipe.destroy
    redirect_to
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
    params.require(:user_recipe).permit(:user_id, :recipe_id, :collection_ids)
  end

  def save_to_all_collection(user_recipe)
    all_default_collection = Collection.where(user: current_user, name: "All")[0]
    UserRecipeCollection.create!(user_recipe:, collection: all_default_collection)
  end

  def save_to_collections(collection_ids, u_recipe)
    collection_ids.each do |id|
      UserRecipeCollection.create!(user_recipe: u_recipe, collection: Collection.find(id))
    end
  end
end
