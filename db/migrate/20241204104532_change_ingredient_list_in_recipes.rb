class ChangeIngredientListInRecipes < ActiveRecord::Migration[7.1]
  def change
    change_column :recipes, :ingredients_list, "varchar[] USING (string_to_array(ingredients_list, ';'))"
  end
end
