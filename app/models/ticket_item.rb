class TicketItem < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :product

  def destroy_item_if_amount_lte(value)
    if amount <= value
      destroy
    end
  end


end
