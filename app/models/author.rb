class Author < ApplicationRecord
  # can be extended to validate multiple fields in the same expression
  validates :last_name, presence: true
  def name
    "#{first_name} #{last_name}"
  end
end
