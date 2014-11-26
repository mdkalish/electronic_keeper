class Category < ActiveRecord::Base
  has_many :products
  CATEGORIES = %w(salad pizza main_course alcohol beverage fastfood soup pancake spaghetti dessert)

  # def load_icons
  #   Dir['../assets/images/left_sidebar/64/*']
  # end

  def show
    @category = Product.where(category: params[:category_id])
  end

end
