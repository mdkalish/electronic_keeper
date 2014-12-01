class AddDefaultsToTicketItems < ActiveRecord::Migration
  def change
    change_column_default :ticket_items, :amount, 0
    change_column_default :ticket_items, :price,  0.0
  end
end
