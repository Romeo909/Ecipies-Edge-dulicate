class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    # raise
    ingredients_id = UserIngredient.where(user: current_user).pluck(:ingredient_id)
    # Without the pluck, I would only get an array of user_ingredients instances

    @ingredients_name = Ingredient.find(ingredients_id).pluck(:name).join(' ')
    @fridge_recipes = Recipe.search_recipes(@ingredients_name) if params[:]

    @recipes = Recipe.search_recipe(params[:query]) if params[:query].present?
    # I want the params[:query] to be equal to the ingredients list
    # Put a button where you can 'Find recipe with what's left in the fridge'
    # This button should launch the search with the pluck array of ingredient's names.
    # So Recipe.search_recipe(pluck_result)

    #  add a link to with params
    # if htis params exists,


    respond_to do |format|
      format.html
      format.text { render partial: 'list', locals: { recipes: @recipes }, formats: [:html] }
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_collection = RecipeCollection.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe.save
  end
end
