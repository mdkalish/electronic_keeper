class RemoveLimitFromFlatNumber < ActiveRecord::Migration
  def change
    change_column :delivery_addresses, :flat_number, :integer, :limit => nil
  end
end
