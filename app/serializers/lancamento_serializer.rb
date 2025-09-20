class LancamentoSerializer < ActiveModel::Serializer
  attributes :id, :data, :valor
  has_one :setor
  has_one :user
  has_one :categoria
end
