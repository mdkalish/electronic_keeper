class CreateCustomersDeliveryAddresses < ActiveRecord::Migration
  def change
    create_table :customers_delivery_addresses, id: false do |t|
      t.belongs_to :delivery_address, index: true
      t.belongs_to :customer, index: true
    end
  end
end
