class Category < ActiveRecord::Base
  has_many :products, as: :product_holder
  validates :name, uniqueness: { case_sensitive: false }
  CATEGORIES = %w(salad pizza main_course alcohol beverage fastfood soup pancake spaghetti dessert)
  accepts_nested_attributes_for :products

  def show
    @category = Product.where(category: params[:category_id])
  end

end
