class RemoveCreatedByIndexFromTickets < ActiveRecord::Migration
  def change
    change_table :tickets do |t|
      # t.remove_index :created_at_and_created_by
      t.index :created_at, unique: true
      t.index [:created_at, :user_id], unique: true
    end
  end
end

