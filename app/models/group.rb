class Group < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5, maximum: 20 }
  validates :icon, presence: true
end
