class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    # Put a button where you can 'Find recipe with what's left in the fridge'
    # This button should launch the search with the pluck array of ingredient's names, if this params exists
    # So Recipe.search_recipe(pluck_result)
    @recipes = @recipes.search_recipes_with_query(params[:query]) if params[:query].present?
    @recipes = @recipes.search_recipes_with_fridge(params[:fridge]) if params[:fridge]

    respond_to do |format|
      format.html
      format.text { render partial: 'list', locals: { recipes: @recipes }, formats: [:html] }
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user_recipe = UserRecipe.new
    collections_all = Collection.where(user: current_user)
    @collections = collections_all.where.not(name: 'All')
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      user_recipe = @recipe.user_recipes.create(user: current_user)
      user_recipe.user_recipe_collections.create(collection: Collection.where(user: current_user, name: 'All')[0])
      # INFO: If we want to add the recipe to a collection at the same time as creating it
      # @recipe.user_recipes.create(user: current_user, collection_ids: [])

      redirect_to user_recipe_path(user_recipe), notice: 'Recipe was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    # @collections = Collection.where(user: current_user)
    @user_recipe = UserRecipe.where(recipe: @recipe, user: current_user)[0]
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.user_id? && @recipe.user == current_user
      @recipe.update(recipe_params)
      redirect_to user_recipe_path(@recipe.user_recipes.where(user: current_user)[0]),
                  notice: 'Recipe was successfully updated.'
    else
      redirect_to user_recipe_path(@recipe.user_recipes.where(user: current_user)[0]),
                  notice: 'You can only edit your own recipes.'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    return unless @recipe.user_id? && @recipe.user == current_user

    @recipe.destroy
    redirect_to collections_path, notice: 'Recipe was successfully deleted.'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :servings, :cooking_time, :ingredients, :image)
  end
end
