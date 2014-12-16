class RemoveSmallPriceFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :small_price, :decimal
  end
end
