class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string :name
      t.decimal :price
      t.text :ingredients
    end
  end
end
