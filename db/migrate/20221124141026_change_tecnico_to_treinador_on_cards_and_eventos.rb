class ChangeTecnicoToTreinadorOnCardsAndEventos < ActiveRecord::Migration[7.0]
  def change
    remove_reference :yellow_cards, :tecnico
    remove_reference :red_cards, :tecnico
    remove_reference :eventos, :tecnico
    add_reference :yellow_cards, :treinador, default: 0
    add_reference :red_cards, :treinador, default: 0
    add_reference :eventos, :treinador, default: 0
  end
end
