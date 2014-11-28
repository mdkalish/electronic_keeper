class AddProductsIdsToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :products_ids, :string
  end
end
