class User < ApplicationRecord
  belongs_to :tipo_usuario

  has_secure_password   # ativa bcrypt para senhas
  validates :cpf, presence: true, uniqueness: true
end

