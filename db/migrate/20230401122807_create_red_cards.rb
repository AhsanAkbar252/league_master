class CreateRedCards < ActiveRecord::Migration[6.1]
  def change
    create_table :red_cards do |t|
      t.integer :time
      t.references :player, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
