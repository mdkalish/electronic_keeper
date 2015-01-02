class Category < ActiveRecord::Base
  has_many :products, inverse_of: :category
  validates :name, uniqueness: { case_sensitive: false }
  CATEGORIES = %w(pizza main_course alcohol beverage fastfood soup salad pancake spaghetti dessert)
  accepts_nested_attributes_for :products

end
