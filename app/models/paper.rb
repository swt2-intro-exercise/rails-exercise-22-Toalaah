class Paper < ApplicationRecord
  validates :title, :venue, :year, presence: true
  validates :year, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
