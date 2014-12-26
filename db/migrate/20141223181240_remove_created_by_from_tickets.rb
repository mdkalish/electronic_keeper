class RemoveCreatedByFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :created_by, :string
  end
end
