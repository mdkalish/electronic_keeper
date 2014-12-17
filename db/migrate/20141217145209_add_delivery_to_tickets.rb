class AddDeliveryToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :delivery, :string, default: "Na miejscu"
  end
end
