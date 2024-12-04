class AddColumnsToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :calories, :integer
    add_column :recipes, :restrictions, :string, array: true
  end
end
