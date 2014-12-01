class Ticket < ActiveRecord::Base
  # has_many :products, as: :product_holder
  has_many :ticket_items
  has_many :products, through: :ticket_items
  # after_save :calculate_total_price, :contains_alcohol?, :count_items
  accepts_nested_attributes_for :products

  # def calculate_total_price
  #   self.total_price = products.map(&:price).inject(0, :+)
  # end

  # def contains_alcohol?
  #   b = products.map(&:category_name).include?("alcohol")
  #   self.alcohol = b
  # end

  # def count_items
  #   self.items_count = products.count
  # end

end
