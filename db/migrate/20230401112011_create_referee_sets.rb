class CreateRefereeSets < ActiveRecord::Migration[6.1]
  def change
    create_table :referee_sets do |t|
      t.references :referee_position, null: false, foreign_key: true
      t.references :referee, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
