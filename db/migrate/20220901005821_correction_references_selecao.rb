class CorrectionReferencesSelecao < ActiveRecord::Migration[7.0]
  def change
    add_reference :selecaos, :grupo, foreing_key:true
    add_reference :selecaos, :confederation, foreing_key:true
  end
end
