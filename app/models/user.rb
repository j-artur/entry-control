class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  belongs_to :sector

  enum role: { admin: 'admin', attendant: 'attendant', employee: 'employee' }

  validate_enum_attribute :role

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :sector, presence: true
end

def role_name role
  case role
  when 'admin'
    'Administrador'
  when 'attendant'
    'Atendente'
  when 'employee'
    'Funcionário'
  end
end
