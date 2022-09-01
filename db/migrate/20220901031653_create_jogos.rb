class CreateJogos < ActiveRecord::Migration[7.0]
  def change
    create_table :jogos do |t|
      t.integer :equipe1
      t.integer :equipe2
      t.integer :g1
      t.integer :g2
      t.integer :p1
      t.integer :p2
      t.datetime :data

      t.timestamps
    end
  end
end
