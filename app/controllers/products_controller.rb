class ProductsController < ApplicationController

  def index
    @products = Product.all
    render layout: 'main'
  end

  def show
    # binding.pry
    @product = Product.all.where(category:"salad")
  end

  def ongoing_tickets
    # @ongoing_tickets = Ticket.all.where(!closed?)
  end

  def add_product_to_ticket
    # product = Product.find(params[:id])

  end

end
