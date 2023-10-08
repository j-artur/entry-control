class Visitor < ApplicationRecord
  validates :cpf, presence: true, uniqueness: true, :mask => "999.999.999-99"
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :rg, presence: true, uniqueness: true, :mask => "99.999.999-9"
  validates :phone, presence: true, :mask => "(99) 99999-9999"
end
