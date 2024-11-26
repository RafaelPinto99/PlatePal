class RemoveDescriptionFromPlans < ActiveRecord::Migration[7.1]
  def change
    remove_column :plans, :description
  end
end
