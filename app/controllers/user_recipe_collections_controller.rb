class UserRecipeCollectionsController < ApplicationController
  def destroy
    @user_recipe_collection = UserRecipeCollection.find(params[:id])
    all_default_collection = Collection.where(user: current_user, name: "All")[0]
    if @user_recipe_collection.collection == all_default_collection
      UserRecipeCollection.where(user_recipe: @user_recipe_collection.user_recipe).destroy_all
    else
      UserRecipeCollection.where(user_recipe: @user_recipe_collection.user_recipe,
                                 collection: all_default_collection).destroy_all
    end
    @user_recipe_collection.destroy
    redirect_to collection_path(@user_recipe_collection.collection)
  end
end
