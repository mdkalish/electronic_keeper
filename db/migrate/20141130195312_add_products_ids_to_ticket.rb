class AddProductsIdsToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :product_ids, :string
  end
end
