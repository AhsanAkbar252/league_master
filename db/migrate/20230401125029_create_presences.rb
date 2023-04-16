class CreatePresences < ActiveRecord::Migration[6.1]
  def change
    create_table :presences do |t|
      t.string :state
      t.references :player, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
