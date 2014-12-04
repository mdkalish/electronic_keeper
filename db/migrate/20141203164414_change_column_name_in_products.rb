class ChangeColumnNameInProducts < ActiveRecord::Migration
  def change
    rename_column :products, :category_name, :category
  end
end
