class Group < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 35 }
  validates :icon, presence: true

  validate :valid_icon?

  def valid_icon?        
    if !icon.nil?
      uri = URI.parse(icon)
      errors.add(:icon, '-icon- should be a valid URL') if uri.host.nil?
    else
      errors.add(:icon, '-icon- should be a valid URL')
    end
  end

  belongs_to :user
  has_many :ingredients
end
