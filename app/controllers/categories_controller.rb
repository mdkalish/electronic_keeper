class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Product.where("category_id = ?", params[:category_id]).to_a.sort_by!{ |item| item.name }
    respond_to :js
  end

end
