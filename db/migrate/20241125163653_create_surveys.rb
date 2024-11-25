class CreateSurveys < ActiveRecord::Migration[7.1]
  def change
    create_table :surveys do |t|
      t.string :restrictions
      t.string :preferences
      t.string :goals
      t.integer :servings
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
