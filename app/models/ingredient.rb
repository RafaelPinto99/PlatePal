class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :plans, through: :shopping_list

  validates :name, uniqueness: true
end
