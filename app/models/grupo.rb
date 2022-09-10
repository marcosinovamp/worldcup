class Grupo < ApplicationRecord
    has_many :selecaos
    has_many :jogos
    # validates :nome, :presence => true
end
