class TicketItem < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :product

  # def destroy_item_if_amount_lte(value)
  #   if amount <= value
  #     destroy
  #   end
  # end

  def crement(sign)
    if sign == '+'
      update_attribute(:amount, amount + 1)
    elsif sign == '-'
      update_attribute(:amount, amount - 1)
      destroy unless amount != 0
    else
      p "Invalid operator"
    end
  end

  def update_price
    update_attribute(:price, amount * product.price) unless amount == 0
  end

end
