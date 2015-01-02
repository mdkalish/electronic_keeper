class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string    :first_name
      t.string    :last_name
      t.integer   :phone_number_1, null: false, index: true
      t.integer   :phone_number_2
      t.index     [:first_name, :last_name]

      t.timestamps
    end
  end
end
