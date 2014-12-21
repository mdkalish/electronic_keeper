class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, uniqueness: true

      t.timestamps
    end
    add_index :users, :name
  end
end
