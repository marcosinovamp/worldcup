class CorrectionSelecao < ActiveRecord::Migration[7.0]
  def change
    remove_column :selecaos, :jg
    remove_column :selecaos, :vt
    remove_column :selecaos, :ep
    remove_column :selecaos, :dr
    remove_column :selecaos, :pt
    remove_column :selecaos, :gp
    remove_column :selecaos, :gc
  end
end