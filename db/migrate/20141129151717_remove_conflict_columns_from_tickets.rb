class RemoveConflictColumnsFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :products, :string
    remove_column :tickets, :products_ids, :string
  end
end
