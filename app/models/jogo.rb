class Jogo < ApplicationRecord
    belongs_to :grupo
    has_many :selecaos
end
