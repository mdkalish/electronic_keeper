class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :products
      t.decimal :total_price
      t.integer :items_count
      t.boolean :alcohol
      t.datetime :to_be_served_at
      t.string :delivery_address
      t.string :created_by
      t.string :ordered_by
      t.string :status
    end
  end
end
