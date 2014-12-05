class Ticket < ActiveRecord::Base
  has_many :ticket_items
  has_many :products, through: :ticket_items
  before_save :update_values
  accepts_nested_attributes_for :products

  def calculate_total_price
    ticket_items.map(&:price).inject(0, :+)
  end

  def count_items
    ticket_items.map(&:amount).inject(0, :+)
  end

  def update_values
    self.total_price = calculate_total_price
    self.items_count = count_items
  end

  # def destroy_empty
  #   if self.count_items == 0
  #     destroy
  #   end
  # end

  # def contains_alcohol?
  #   b = products.map(&:category_name).include?("alcohol")
  #   self.alcohol = b
  # end

end
