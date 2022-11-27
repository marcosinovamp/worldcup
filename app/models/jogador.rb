class Jogador < ApplicationRecord
    belongs_to :selecao
    has_one :confederation, through: :selecao
    has_many :grupos, through: :selecao
    has_one :treinador, through: :selecao
    has_many :yellow_cards
    has_many :red_cards
    has_many :eventos
end