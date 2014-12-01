class TicketItem < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :product

end
