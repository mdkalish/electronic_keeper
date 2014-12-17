class AddDeliveryToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :delivery, :boolean, default: true
  end
end
