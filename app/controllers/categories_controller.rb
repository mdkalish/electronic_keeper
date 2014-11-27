class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Product.where("category_name = ?", params[:category_name])
    # binding.pry
    respond_to :js
  end

end
