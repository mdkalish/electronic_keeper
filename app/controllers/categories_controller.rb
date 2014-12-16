class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:category_id])
    respond_to :js
  end

end
