class AddIngredientsListFromRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :ingredients_list, :string
  end
end
