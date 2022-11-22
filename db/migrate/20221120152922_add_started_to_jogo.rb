class AddStartedToJogo < ActiveRecord::Migration[7.0]
  def change
    add_column :jogos, :started?, :boolean, default: false
  end
end