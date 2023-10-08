class Visit < ApplicationRecord
  belongs_to :visitor
  belongs_to :sector
  belongs_to :user, optional: true
  validates :visitor, presence: true
  validates :sector, presence: true
end
