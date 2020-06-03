class Ingredient < ApplicationRecord
  scope :grouped, -> { where.not(group: [nil]).order('created_at DESC') }
  scope :non_grouped, -> { where(group: [nil]).order('created_at DESC') }

  validates :name, presence: true, length: { minimum: 3, maximum: 35 }
  validate :valid_amount

  belongs_to :author, class_name: 'User', dependent: :destroy, inverse_of: :ingredients
  belongs_to :group, optional: true
  belongs_to :store

  private

  def valid_amount
    if amount.nil?
      errors.add(:amount, 'must be a number')
    else
      errors.add(:amount, 'must be less or equal to 9999.99') if amount > 9999.99
      errors.add(:amount, 'must be higher than 0') if amount <= 0
    end
  end
end
