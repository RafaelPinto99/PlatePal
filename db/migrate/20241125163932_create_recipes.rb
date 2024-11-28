class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients_list
      t.text :instructions
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
