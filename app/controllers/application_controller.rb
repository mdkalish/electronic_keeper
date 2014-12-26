class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  include SessionsHelper

  def initialize_ticket
    # binding.pry
    @ticket = current_user.tickets.find_by_id(session[:ticket_id])
    if @ticket.nil?
      @ticket = current_user.tickets.find_by_status("open") || current_user.tickets.create!
      session[:ticket_id] = @ticket.id
      @ticket.update!(todays_nr: Ticket.how_many_today) if @ticket.todays_nr == nil
    end
  end

  def initialize_ticket_item
    # binding.pry
    @product = Product.find(params[:id])
    @ticket_item = current_user.tickets.find(session[:ticket_id]).ticket_items.find_or_create_by(product_id: @product.id)
  end

  def initialize_current_tickets
    @tickets = Ticket.find_all("underway")
  end

end
