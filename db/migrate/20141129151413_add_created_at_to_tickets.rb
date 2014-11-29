class AddCreatedAtToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :created_at, :datetime
  end
end
