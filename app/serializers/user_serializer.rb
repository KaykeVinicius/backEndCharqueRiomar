class UserSerializer < ActiveModel::Serializer
  attributes :id, :descricao, :cpf, :password_digest, :email
  has_one :tipo_usuario
end
