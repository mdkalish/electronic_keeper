class AddCustomerIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :customer_id, :integer
    add_index :tickets, :customer_id
  end
end
