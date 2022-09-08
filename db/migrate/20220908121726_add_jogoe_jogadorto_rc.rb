class AddJogoeJogadortoRc < ActiveRecord::Migration[7.0]
  def change
    add_reference :red_cards, :jogo
    add_reference :red_cards, :jogador
  end
end
