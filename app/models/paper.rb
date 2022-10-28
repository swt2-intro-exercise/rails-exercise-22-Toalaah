class Paper < ApplicationRecord
  has_and_belongs_to_many :authors
  scope :created_before, ->(year) { where("year < ?", year) if year.present? }
  scope :created_on, ->(year) { where("year = ?", year) if year.present? }
  scope :created_after, ->(year) { where("year > ?", year) if year.present? }
  validates :title, :venue, :year, presence: true
  validates :year, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
