class Selecao < ApplicationRecord
  has_many :grupos
  belongs_to :confederation
  has_many :jogos
  
  def jogos
    Jogo.all.select{|j| j.equipe1 == self.id || j.equipe2 == self.id}
  end
end