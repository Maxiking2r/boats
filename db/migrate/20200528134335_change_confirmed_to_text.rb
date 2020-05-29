class ChangeConfirmedToText < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :confirmed, :string, default: "pending"
  end
end
