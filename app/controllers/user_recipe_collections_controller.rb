class UserRecipeCollectionsController < ApplicationController
  def destroy
    @user_recipe_collection = UserRecipeCollection.find(params[:id])
    @user_recipe_collection.destroy
    redirect_to collection_path(@user_recipe_collection.collection)
  end
end
