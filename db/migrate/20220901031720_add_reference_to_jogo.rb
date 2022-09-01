class AddReferenceToJogo < ActiveRecord::Migration[7.0]
  def change
    add_reference :jogos, :grupo
  end
end
