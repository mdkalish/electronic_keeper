class CreateTicketItems < ActiveRecord::Migration
  def change
    create_table :ticket_items do |t|
      t.integer :product_id
      t.integer :ticket_id
      t.integer :amount
      t.decimal :price

      t.timestamps
    end
  end
end
