class Selecao < ApplicationRecord
  has_many :grupos
  belongs_to :confederation
end
