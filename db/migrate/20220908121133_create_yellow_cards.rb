class CreateYellowCards < ActiveRecord::Migration[7.0]
  def change
    create_table :yellow_cards do |t|

      t.timestamps
    end
  end
end
