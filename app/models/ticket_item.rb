class TicketItem < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :product

  def destroy_item_if(value)
    if self.amount == value
      self.destroy
    end
  end


end
