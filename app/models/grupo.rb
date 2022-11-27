class Grupo < ApplicationRecord
    has_many :selecaos
    has_many :jogos
    has_many :jogadors, through: :selecaos
    has_many :treinadors, through: :selecaos
    has_many :eventos, through: :jogos
end
