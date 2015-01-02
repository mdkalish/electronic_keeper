class CreateDeliveryAddressesCustomers < ActiveRecord::Migration
  def change
    create_table :delivery_addresses_customers, id: false do |t|
      t.belongs_to :delivery_addresses, index: true
      t.belongs_to :customer, index: true
    end
  end
end
