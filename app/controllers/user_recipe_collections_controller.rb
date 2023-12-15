class UserRecipeCollectionsController < ApplicationController
  def destroy
    @user_recipe_collection = UserRecipeCollection.find(params[:id])
    all_default_collection = Collection.where(user: current_user, name: "All")[0]
    if @user_recipe_collection.collection == all_default_collection
      UserRecipeCollection.where(user_recipe: @user_recipe_collection.user_recipe).destroy_all
    else
      @user_recipe_collection.destroy
      in_all = all_default_collection.user_recipe_collections.where(user_recipe: @user_recipe_collection.user_recipe)[0]
      in_others = UserRecipeCollection.where(user_recipe: @user_recipe_collection.user_recipe).where.not(collection: all_default_collection)[0]
      in_all.destroy if in_all && in_others.nil?
    end
    redirect_to collection_path(@user_recipe_collection.collection)
  end
end
