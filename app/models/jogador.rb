class Jogador < ApplicationRecord
    belongs_to :selecao
    has_many :yellow_cards
    has_many :red_cards
    has_many :eventos
end