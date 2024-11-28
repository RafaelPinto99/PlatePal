class AddPositionToPlanRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :plan_recipes, :position, :integer, default: nil, null: true
  end
end
