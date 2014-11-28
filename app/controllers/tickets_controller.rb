class TicketsController < ApplicationController

  def new
    @ticket = Ticket.new()
  end

  def index
    @tickets = Ticket.all
  end


  def prepare
    @product = Product.find(params[:id])
    # binding.pry
    @ticket ? @ticket.products.to_arr.push(@product) : Ticket.create!(products: [@product])
    @ticket = Ticket.last
    # binding.pry
    respond_to :js
  end

  def remove_product_from_ticket
    # check routes.rb -> scope
    # binding.pry
    # @ticket = Ticket.find(params[:ticket_id])
    # @ticket.products.find(params[:product_id]).destroy
    # @ticket.reload
    # respond_to :js
  end

end
