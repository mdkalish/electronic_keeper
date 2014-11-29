class AddProductHolderToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :product_holder, polymorphic: true, index: true
  end
end
