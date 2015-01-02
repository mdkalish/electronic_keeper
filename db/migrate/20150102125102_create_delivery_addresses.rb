class CreateDeliveryAddresses < ActiveRecord::Migration
  def change
    create_table :delivery_addresses do |t|
      t.string    :city, null: false
      t.string    :street, index: true
      t.string    :flat_number
      t.integer   :house_number, null: false
      t.integer   :distance_by_car, null: true
      t.integer   :distance, null: true
      t.decimal   :longitude, :precision => 10 ,:scale => 7, null: true
      t.decimal   :latitude, :precision => 10 ,:scale => 7, null: true
      t.index     [:city, :street]
      t.timestamps
    end
  end
end
