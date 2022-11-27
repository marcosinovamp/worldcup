class AddTecnicoToCardsandEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :yellow_cards, :tecnico, default: 0
    add_reference :red_cards, :tecnico, default: 0
    add_reference :eventos, :tecnico, default: 0
  end
end
