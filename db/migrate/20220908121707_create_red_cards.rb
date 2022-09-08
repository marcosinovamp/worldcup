class CreateRedCards < ActiveRecord::Migration[7.0]
  def change
    create_table :red_cards do |t|

      t.timestamps
    end
  end
end
