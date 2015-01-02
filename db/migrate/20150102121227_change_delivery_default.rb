class ChangeDeliveryDefault < ActiveRecord::Migration
  def change
    change_column_default :tickets, :delivery, false
  end
end
