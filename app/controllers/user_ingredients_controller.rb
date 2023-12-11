class UserIngredientsController < ApplicationController
  # before_action :set_ingredient, only: %i[edit]

  def index
    @user_ingredients = UserIngredient.where(user: current_user)
    # I am not sure about this instance var down here. It should be use by the _search.html.erb
    @path = user_ingredients_path

    # Fetch ingredients list to launch a search with it
    ingredients_id = UserIngredient.where(user: current_user).pluck(:ingredient_id)
    # Without the pluck, I would only get an array of user_ingredients instances
    @ingredients_name = Ingredient.find(ingredients_id).pluck(:name).join(' ')
  end

  def create
    # raise
    @user_ingredient = UserIngredient.new(user: current_user, ingredient_id: params[:ingredient_id])
    if @user_ingredient.save
      redirect_to ingredients_path, notice: "#{@user_ingredient.ingredient.name} added to your kitchen!"
    else
      ingredient = Ingredient.find(params[:ingredient_id])
      # Should not refresh the page and so that you still have your query in the search bar(witch some JS)
      # When I use status: :unprocessable_entity, it does not refresh, but there is no error messages!
      redirect_to ingredients_path, notice: "#{ingredient.name}'s already in kictchen"
    end
  end

  def destroy
    @user_ingredient = UserIngredient.find(params[:id])
    @user_ingredient.delete
    redirect_to user_ingredients_path
  end

  # def create
  #   @ingredient = Ingredient.new(ingredient_params)
  #   if @ingredient.save
  #     UserIngredient.create(user: current_user, ingredient: @ingredient)
  #     redirect_to root_path, notice: 'Ingredient was added to your ingredients.'
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def edit
  # end

  # def update
  #   @ingredient.update(ingredient_params)
  #   redirect_to root_path, notice: 'Ingredient was updated.'
  # end

  # private

  # def ingredient_params
  #   params.require(:ingredient).permit(:name)
  # end

  # def set_ingredient
  #   @ingredient = Ingredient.find(params[:id])
  # end
end
