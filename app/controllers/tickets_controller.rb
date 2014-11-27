class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end


  def show
    @ticket ? @ticket.push(Product.find(params[:id])) : @ticket = Product.find(params[:id])
    respond_to :js
  end

end
