class AddTodaysNrToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :todays_nr, :integer
  end
end
