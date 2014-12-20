class AddUnderwayedAtToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :underwayed_at, :datetime
  end
end
