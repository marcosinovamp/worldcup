class CreateSelecaos < ActiveRecord::Migration[7.0]
  def change
    create_table :selecaos do |t|
      t.string :nome
      t.string :continente
      t.string :bandeira
      t.integer :jg
      t.integer :vt
      t.integer :ep
      t.integer :dr
      t.integer :pt
      t.integer :gp
      t.integer :gc

      t.timestamps
    end
  end
end
