class ChangeFlatNumberType < ActiveRecord::Migration
  def change
    change_column :delivery_addresses, :flat_number, :integer
  end
end
