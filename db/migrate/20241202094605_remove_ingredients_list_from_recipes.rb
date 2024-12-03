class RemoveIngredientsListFromRecipes < ActiveRecord::Migration[7.1]
  def change
    remove_column :recipes, :ingredients_list, :string
  end
end
