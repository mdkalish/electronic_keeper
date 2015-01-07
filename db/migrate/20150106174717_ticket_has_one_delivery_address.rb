class TicketHasOneDeliveryAddress < ActiveRecord::Migration
  def change
    change_table :tickets do |t|
      t.belongs_to :delivery_address, index: true
      t.remove :delivery_address
    end
  end
end
