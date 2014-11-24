class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :category
      t.string :name
      t.decimal :price
      t.decimal :small_price
      t.text :ingredients
    end
  end
end
