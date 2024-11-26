class RemovePlanReferenceFromRecipes < ActiveRecord::Migration[7.1]
  def change
    remove_reference :recipes, :plan, foreign_key: true
  end
end
