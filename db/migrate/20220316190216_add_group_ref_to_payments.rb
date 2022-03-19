class AddGroupRefToPayments < ActiveRecord::Migration[7.0]
  def change
    add_reference :payments, :group, null: false, foreign_key: true
  end
end
