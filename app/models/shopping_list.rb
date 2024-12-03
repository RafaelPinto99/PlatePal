class ShoppingList < ApplicationRecord
  belongs_to :plan
  belongs_to :ingredient

end
