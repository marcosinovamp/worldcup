class CreateConfederations < ActiveRecord::Migration[7.0]
  def change
    create_table :confederations do |t|
      t.string :nome
      t.integer :jg
      t.integer :pt
      t.integer :vt
      t.integer :ep
      t.integer :dr
      t.integer :gp
      t.integer :gc

      t.timestamps
    end
  end
end
