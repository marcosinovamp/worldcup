class Selecao < ApplicationRecord
  has_many :grupos
  belongs_to :confederation
  has_many :jogos
end
