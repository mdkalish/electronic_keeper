class RemoveCreatedByIndexFromTickets < ActiveRecord::Migration
  def change
    change_table :tickets do |t|
      t.index :created_at
    end
  end
end

