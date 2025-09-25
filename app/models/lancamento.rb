class Lancamento < ApplicationRecord
  belongs_to :setor
  belongs_to :categoria
end
