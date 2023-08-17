class Review < ApplicationRecord
  belongs_to :restaurant
  validates :rating, numericality: { in: (0..5), only_integer: true }
  validates :content, presence: true
end
