class Survey < ApplicationRecord
  belongs_to :user

  validates :goals, :preferences, :restrictions, :servings, presence: true

  enum goal: { save_time: 0, healthy: 1, diet: 2 }
  enum availability: { limited: 0, open: 1 }
  enum diet: { no_restriction: 0, vegetarian: 1, vegan: 2, gluten_free: 3, dairy_free: 4, low_carb: 5 }
end
