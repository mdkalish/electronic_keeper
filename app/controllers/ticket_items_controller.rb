class TicketItemsController < ApplicationController
  before_filter :initialize_ticket
  before_filter :initialize_ticket_item

  def create
    # binding.pry
    @ticket_item.crement('+') && @ticket.ticket_items<<@ticket_item
    @ticket_item.update_price
    respond_to :js
  end

  def update
    @ticket_item.crement('-') unless params[:decrement].nil?
    @ticket_item.update_price
    render action: 'create'
  end

end
