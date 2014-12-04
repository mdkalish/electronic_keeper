class AddIndexOnCategoryId < ActiveRecord::Migration
  def change
    add_index :products, :category_id
  end
end
