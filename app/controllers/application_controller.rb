class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def initialize_ticket
    @ticket = Ticket.find_by_id(session[:ticket_id])
    if @ticket.nil?
      # binding.pry
      @ticket = Ticket.find_by_status("open") || Ticket.create!
      session[:ticket_id] = @ticket.id
    end
  end

  def initialize_ticket_item
    @product = Product.find(params[:id])
    @ticket_item = TicketItem.find_or_create_by(ticket_id: session[:ticket_id], product_id: @product.id)
  end

  def initialize_current_tickets
    @tickets = Ticket.find_all("underway")
  end

end
