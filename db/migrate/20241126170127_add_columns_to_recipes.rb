class AddColumnsToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :calories, :integer
    add_column :recipes, :restrictions, :string, array: true
    change_column :recipes, :ingredients_list, "varchar[] USING (string_to_array(ingredients_list, ';'))"
  end
end
