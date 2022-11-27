class YellowCard < ApplicationRecord
    belongs_to :jogo
    has_one :jogador
    has_one :treinador
end
