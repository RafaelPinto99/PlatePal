class Recipe < ApplicationRecord
  has_one_attached :photo
  # has_many :plan_recipes
  has_many :plans, through: :plan_recipes
end
