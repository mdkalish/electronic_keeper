class RemoveProductIdsFromTicket < ActiveRecord::Migration
  def change
    remove_column :tickets, :product_ids, :string
  end
end
