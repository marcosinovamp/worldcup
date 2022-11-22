class YellowCard < ApplicationRecord
    belongs_to :jogo
    belongs_to :jogador
    has_one :selecao, through: :jogador
end
