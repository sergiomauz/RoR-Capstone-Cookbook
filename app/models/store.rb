class Store < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 35 }, uniqueness: true

  has_many :ingredients
end
