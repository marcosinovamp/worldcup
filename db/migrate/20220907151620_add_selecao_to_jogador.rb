class AddSelecaoToJogador < ActiveRecord::Migration[7.0]
  def change
    add_reference :jogadors, :selecao
  end
end
