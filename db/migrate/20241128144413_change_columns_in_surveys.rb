class ChangeColumnsInSurveys < ActiveRecord::Migration[7.1]
  def change
    drop_table :surveys

    create_table :surveys do |t|
      t.integer :goal
      t.integer :availability
      t.integer :diet
      t.integer :servings
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
