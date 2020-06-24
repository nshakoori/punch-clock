class AddPunchedOutAndStatusToPunchCards < ActiveRecord::Migration[6.0]
  def change
    add_column :punch_cards, :punched_out, :boolean, default: true
    add_column :punch_cards, :status, :string, default: "active"
  end
end
