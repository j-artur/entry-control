class Sector < ApplicationRecord
  belongs_to :unit
  has_many :users
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :unit, presence: true
end
