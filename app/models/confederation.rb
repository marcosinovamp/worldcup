class Confederation < ApplicationRecord
    has_many :selecaos
    has_many :jogadors, through: :selecaos
    has_many :treinadors, through: :selecaos
    has_many :red_cards, through: :jogadors
    has_many :yellow_cards, through: :jogadors
    has_many :eventos, through: :jogadors
    has_many :grupos, through: :selecaos
end
