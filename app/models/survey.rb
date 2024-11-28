class Survey < ApplicationRecord
  belongs_to :user

  # validates :goal, :availability, :diet, :servings, presence: true

  enum goal: { save_time: 0, healthy: 1, diet: 2 }
  enum availability: { limited: 0, open: 1 }
  enum diet: { no_restriction: 0, vegetarian: 1, vegan: 2, gluten_free: 3, dairy_free: 4, low_carb: 5 }

  def self.goal_options
      # This method returns an array of arrays, where each sub-array contains a symbol and a humanized string.
      # The symbol is the key of the enum, and the humanized string is used as the label in the survey form.
      # Survey.goals.keys.map { |goal| [goal.to_sym, goal.humanize] }

      # To customize the labels, you can use the following syntax:
     [
       [:save_time, "Save time during the week"],
       [:healthy, "Create healthy, balanced meals"],
       [:diet, "Stick to a specific diet"]
     ]
  end

  def self.availability_options
    [
      [:limited, "I need quick, under 30-minute recipes"],
      [:open, "I can dedicate more time to cooking"]
    ]
  end

  def self.diet_options
    [
      [:no_restriction, "We eat everything"],
      [:vegetarian, "Vegetarian"],
      [:vegan, "Vegan"],
      [:gluten_free, "Gluten-free"],
      [:dairy_free, "Dairy-free"],
      [:low_carb, "Low-carb"]
    ]
  end
end
