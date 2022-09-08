class AddJogoseJogadoresToYc < ActiveRecord::Migration[7.0]
  def change
    add_reference :yellow_cards, :jogo
    add_reference :yellow_cards, :jogador
  end
end
