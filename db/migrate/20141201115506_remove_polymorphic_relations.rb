class RemovePolymorphicRelations < ActiveRecord::Migration
  def change
    remove_column :products, :product_holder_id, :integer
    remove_column :products, :product_holder_type, :string
  end
end
