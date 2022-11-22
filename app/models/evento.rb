class Evento < ApplicationRecord
    belongs_to :jogo
    belongs_to :jogador
end
