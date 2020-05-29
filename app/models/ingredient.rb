class Ingredient < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 35 }    
  validate :valid_amount
  
  def valid_amount
    errors.add(:amount, '-amount- should have a value higher than 0 and less (or equal) than 9999.99') unless amount > 0 || amount <= 9999.99
  end    
end
