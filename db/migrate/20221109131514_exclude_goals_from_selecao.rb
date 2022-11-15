class ExcludeGoalsFromSelecao < ActiveRecord::Migration[7.0]
  def change
    remove_column :selecaos, :goals
  end
end
