class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Product.where("category_name = ?", params[:category_name]).to_a.sort_by!{ |item| item.name }
    # binding.pry
    respond_to :js
  end

end
