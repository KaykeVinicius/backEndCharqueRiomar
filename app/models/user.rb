class User < ApplicationRecord
  has_secure_password
  belongs_to :tipo_usuario
  
  validates :cpf, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
