class ProductsController < ApplicationController

  def index
    @products = Product.all
    # binding.pry
    render layout: 'main'
  end

  def create
    binding.pry
    # @product = current_ticket.products.build(product_params)
  end

  def ongoing_tickets
    # @ongoing_tickets = Ticket.all.where(!closed?)
  end

  def add_product_to_ticket
    # product = Product.find(params[:id])
  end

  private

    # def product_params
    #   params.require(:product).permit(:name, :price, :category_name)
    # end

end
