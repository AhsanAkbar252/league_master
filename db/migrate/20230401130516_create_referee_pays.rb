class CreateRefereePays < ActiveRecord::Migration[6.1]
  def change
    create_table :referee_pays do |t|
      t.integer :amount
      t.references :referee_position, null: false, foreign_key: true
      t.references :referee_level, null: false, foreign_key: true

      t.timestamps
    end
  end
end
