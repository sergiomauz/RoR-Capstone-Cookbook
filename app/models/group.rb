class Group < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 35 }
  validates :icon, presence: true
end
