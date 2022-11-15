class AddReferencesToEvento < ActiveRecord::Migration[7.0]
  def change
    add_reference :eventos, :jogo
    add_reference :eventos, :jogador
  end
end
