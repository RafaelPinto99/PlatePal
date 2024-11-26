class Plan < ApplicationRecord
  belongs_to :user
  has_many :recipes, through: :plan_recipes
  has_many :plan_recipes, dependent: :destroy

  validates :title, presence: true
end
