class CreateSoups < ActiveRecord::Migration
  def change
    create_table :soups do |t|
      t.string :name
      t.decimal :price
      t.text :ingredients
      t.string :category
    end
  end
end
