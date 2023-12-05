class UserIngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[edit]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      UserIngredient.create(user: current_user, ingredient: @ingredient)
      redirect_to root_path, notice: 'Ingredient was added to your ingredients.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @ingredient.update(ingredient_params)
    redirect_to root_path, notice: 'Ingredient was updated.'
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
