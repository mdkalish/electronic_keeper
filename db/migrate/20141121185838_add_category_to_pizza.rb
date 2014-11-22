class AddCategoryToPizza < ActiveRecord::Migration
  def change
    add_column :pizzas, :category, :string
  end
end
