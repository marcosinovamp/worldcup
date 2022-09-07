class CreateJogadors < ActiveRecord::Migration[7.0]
  def change
    create_table :jogadors do |t|
      t.string :nome
      t.string :posicao
      t.string :status
      t.integer :gols
      t.integer :yellow
      t.integer :red
      t.integer :age
      t.integer :number

      t.timestamps
    end
  end
end
