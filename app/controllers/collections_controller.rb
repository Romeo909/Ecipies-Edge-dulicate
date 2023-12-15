class CollectionsController < ApplicationController
  def index
    all_recipes_collection = Collection.new(name: "All", user: current_user)
    favorite_recipes_collection = Collection.new(name: "Favorites", user: current_user)
    favorite_recipes_collection.save
    all_recipes_collection.save
    @collections = Collection.where(user: current_user).order(:name)
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    if @collection.save
      redirect_to collections_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.update(collection_params)
      redirect_to collection_path(@collection)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    if @collection.destroy
      redirect_to collections_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:name)
  end
end
