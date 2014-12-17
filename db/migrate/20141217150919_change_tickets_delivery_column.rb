class ChangeTicketsDeliveryColumn < ActiveRecord::Migration
  def change
    change_column :tickets, :delivery, :boolean, default: true
  end
end
