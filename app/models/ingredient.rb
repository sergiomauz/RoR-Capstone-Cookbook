class Ingredient < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 35 }
  validate :valid_amount

  def valid_amount
    errors.add(:amount, '-amount- should be less or equal to 9999.99') if amount > 9999.99
    errors.add(:amount, '-amount- should be higher than 0') if amount <= 0
  end
end
