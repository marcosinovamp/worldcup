class YellowCard < ApplicationRecord
    belongs_to :jogo
    belongs_to :jogador
    # validates :jogo_id, :presence => true
    # validates :jogador_id, :presence => true
end
