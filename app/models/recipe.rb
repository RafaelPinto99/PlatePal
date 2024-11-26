class Recipe < ApplicationRecord
  belongs_to :plan
  has_one_attached :photo
end
