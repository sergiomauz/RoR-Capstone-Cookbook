class Group < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 35 }
  validates :icon, presence: true

  validate :valid_icon?

  def valid_icon?
    if icon.nil?
      errors.add(:icon, '-icon- must be a valid URL')
    else
      uri = URI.parse(icon)
      errors.add(:icon, '-icon- must be a valid URL') if uri.host.nil?
    end
  end

  belongs_to :user
  has_many :ingredients
end
