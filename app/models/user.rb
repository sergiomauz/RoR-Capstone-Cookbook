require 'uri'

class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 35 }
  validates :username, presence: true, length: { maximum: 15 }

  validate :minimum_length
  validate :valid_avatar?

  def minimum_length
    errors.add(:name, '-name- should have 5 characters or more') if name.length < 5
    errors.add(:username, '-username- should have 3 characters or more') if username.length < 3
  end

  def valid_avatar?    
    if !avatar.nil?
      uri = URI.parse(avatar)
      errors.add(:avatar, '-avatar- should be a valid URL') if uri.host.nil?
    end
  end

  has_many :groups
  has_many :ingredients, inverse_of: :author, foreign_key: 'author_id'
end
