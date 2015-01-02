class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string    :first_name
      t.string    :last_name
      t.string    :phone_number_1, null: false, index: true
      t.string    :phone_number_2
      t.index     [:first_name, :last_name]
      t.index     :phone_number_1
      t.timestamps
    end
  end
end
