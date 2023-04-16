class CreateDivisionReferees < ActiveRecord::Migration[6.1]
  def change
    create_table :division_referees do |t|
      t.references :referee_level, null: false, foreign_key: true
      t.references :division, null: false, foreign_key: true
      t.references :referee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
