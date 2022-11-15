class AddGoalsToSelecao < ActiveRecord::Migration[7.0]
  def change
    add_column :selecaos, :goals, :integer
  end
end
