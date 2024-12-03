class Plan < ApplicationRecord
  belongs_to :user
  has_many :plan_recipes, dependent: :destroy
  has_many :recipes, through: :plan_recipes
  has_many :shopping_lists
  has_many :ingredients, through: :shopping_list

  validates :title, presence: true
end
