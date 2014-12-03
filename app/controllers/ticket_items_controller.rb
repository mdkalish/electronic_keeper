class TicketItemsController < ApplicationController
  before_filter :initialize_ticket


  def create
    @product = Product.find(params[:id])
    @ticket_item = TicketItem.find_or_create_by(ticket_id: session[:ticket_id], product_id: @product.id)
    params[:decrement] ? crement(@ticket_item, '-') : crement(@ticket_item, '+') && @ticket.ticket_items<<@ticket_item
    @ticket_item.update_attribute(:price, @ticket_item.amount * @product.price)
    @ticket_item.destroy_item_if_amount_is(0)
    respond_to :js
  end

end
