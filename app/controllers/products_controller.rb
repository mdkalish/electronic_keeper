class ProductsController < ApplicationController

  def index
    @products = Product.all
    # binding.pry
    respond_to do |format|
      format.html { render layout: 'main'  }
      format.json { render json: @products }
    end
  end

end
