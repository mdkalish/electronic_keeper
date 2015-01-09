class AddNameToDeliveryAddresses < ActiveRecord::Migration
  def change
    add_column :delivery_addresses, :name, :string, unique: true
    add_index :delivery_addresses, :name
  end
end
