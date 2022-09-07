class CreateTreinadors < ActiveRecord::Migration[7.0]
  def change
    create_table :treinadors do |t|
      t.string :nome

      t.timestamps
    end
  end
end
