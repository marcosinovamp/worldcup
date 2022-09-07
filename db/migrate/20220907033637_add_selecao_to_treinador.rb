class AddSelecaoToTreinador < ActiveRecord::Migration[7.0]
  def change
    add_reference :treinadors, :selecao
  end
end
