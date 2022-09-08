class RemoveCAandCvFromJogador < ActiveRecord::Migration[7.0]
  def change
    remove_column :jogadors, :red
    remove_column :jogadors, :yellow
  end
end
