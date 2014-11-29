class RemoveTicketIdFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :ticket_id, :integer
  end
end
