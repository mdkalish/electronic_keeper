# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Product.where({ :name => ["Brokułka", "Desperados", "Gingers"] })

10.times do |n|
  Product.create!(category_name: "Sample category",
                  name:          "Sample name no #{n+1}",
                  price:         rand(4..25),
                  ingredients:   "")
end

def return_random_products_ids(count)
  @ids = []
  count.times do
    @ids << Product.all.sample.id
  end
  @ids
end

def return_random_products(ids)
  Product.find(ids)
end

def calculate_total_price_for(products)
  products.map(&:price).inject(0, :+)
end

def contains_alcohol?(products)
  products.map(&:category_name).include?("alcohol")
end

10.times do |n|
  products_ids = return_random_products_ids(rand(3..6))
  products = return_random_products(products_ids)
  Ticket.create!(products:         products,
                 products_ids:     products_ids.to_s,
                 total_price:      calculate_total_price_for(products),
                 items_count:      products.count,
                 alcohol:          contains_alcohol?(products),
                 to_be_served_at:  1.day.from_now,
                 delivery_address: "Addres no #{1+n}",
                 created_by:       "Bożena",
                 ordered_by:       "Krzysztof",
                 status:           "open" )
end
