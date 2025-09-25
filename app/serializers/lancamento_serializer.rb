class LancamentoSerializer < ActiveModel::Serializer
  attributes :id, :setor_id, :categoria_id, :data, :valor

  # Comentando relações para teste sem auth
  # belongs_to :user
  # belongs_to :setor
  # belongs_to :categoria
end
