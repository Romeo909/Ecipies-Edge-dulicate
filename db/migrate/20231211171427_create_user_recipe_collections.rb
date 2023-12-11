class CreateUserRecipeCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :user_recipe_collections do |t|
      t.references :collection, null: false, foreign_key: true
      t.references :user_recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
