class IndexTickets < ActiveRecord::Migration
  def change
    add_index :tickets, [:created_at, :created_by]
  end
end
