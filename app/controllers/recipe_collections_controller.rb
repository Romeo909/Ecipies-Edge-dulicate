class RecipeCollectionsController < ApplicationController
  def create
    @recipe_collection = RecipeCollection.new(recipe_collection_params)
    recipe = Recipe.find(params[:recipe_id])
    @recipe_collection.recipe = recipe
    if @recipe_collection.save
      redirect_to recipe_path(@recipe_collection.recipe), notice: 'Recipe added to collection'
    else
      render 'recipes/show', notice: 'Something went wrong'
    end
  end

  private

  def recipe_collection_params
    params.require(:recipe).permit(:recipe_id, collection_ids: [])
  end
end
