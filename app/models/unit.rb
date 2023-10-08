class Unit < ApplicationRecord
  has_many :sectors
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
end
