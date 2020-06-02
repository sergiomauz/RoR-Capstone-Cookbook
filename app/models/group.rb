class Group < ApplicationRecord
  attr_accessor :image_file

  validates :name, presence: true, length: { minimum: 3, maximum: 35 }
  validates :icon, presence: true

  validate :valid_icon?

  belongs_to :user
  has_many :ingredients

  def total_amount
    sum = 0
    ingredients.all.each do |i|
      sum += i.amount
    end
    sum
  end

  private

  def valid_icon?
    if icon.nil?
      errors.add(:icon, 'must be a valid image')
    else
      uri = URI.parse(icon)
      errors.add(:icon, 'must be a valid URL') if uri.host.nil?
    end
  end
end
