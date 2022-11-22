class ChangeStartedOnJogo < ActiveRecord::Migration[7.0]
  def change
    add_column :jogos, :started, :boolean, default: false
    remove_column :jogos, :started?
  end
end
