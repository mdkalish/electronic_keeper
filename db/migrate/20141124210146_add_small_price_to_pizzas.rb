class AddSmallPriceToPizzas < ActiveRecord::Migration
  def change
    add_column :pizzas, :small_price, :decimal
  end
end
