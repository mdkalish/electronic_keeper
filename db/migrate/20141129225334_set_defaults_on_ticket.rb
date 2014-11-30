class SetDefaultsOnTicket < ActiveRecord::Migration
  def change
    change_column_default :tickets, :total_price, 0
    change_column_default :tickets, :items_count, 0
    change_column_default :tickets, :alcohol, true
  end
end
