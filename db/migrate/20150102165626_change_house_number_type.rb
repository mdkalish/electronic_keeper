class ChangeHouseNumberType < ActiveRecord::Migration
  def change
    change_column :delivery_addresses, :house_number, :string
  end
end
