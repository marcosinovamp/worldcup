class Treinador < ApplicationRecord
    belongs_to :selecao
    has_many :grupos, through: :selecao
    has_one :confederation, through: :selecao
    has_many :jogadors, through: :selecao
    has_many :eventos
    has_many :yellow_cards
    has_many :red_cards
end
