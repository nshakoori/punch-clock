class CreatePunchCards < ActiveRecord::Migration[6.0]
  def change
    create_table :punch_cards do |t|
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
