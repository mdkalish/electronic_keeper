class ChangeColumnName < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.rename :category, :category_name
    end
  end
end
