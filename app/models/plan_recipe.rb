class PlanRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :plan

  validates :recipe_id, :plan_id, presence: true
end