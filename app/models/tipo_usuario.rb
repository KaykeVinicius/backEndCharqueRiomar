class TipoUsuario < ApplicationRecord
    has_many :users

    validates :descricao, presence: true, uniqueness: true
end
