class CreatePunchRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :punch_records do |t|
      t.references :punch_card, foreign_key: true, null: false
      t.datetime "punch_in", null: false
      t.datetime "punch_out"
      t.text "notes"

      t.timestamps
    end
  end
end
