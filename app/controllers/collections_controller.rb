class CollectionsController < ApplicationController
  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    if @collection.save
      redirect_to user_recipes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :description)
  end
end
