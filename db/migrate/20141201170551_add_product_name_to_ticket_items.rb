class AddProductNameToTicketItems < ActiveRecord::Migration
  def change
    add_column :ticket_items, :product_name, :string
  end
end
