class Product < ActiveRecord::Base
  validates :price, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :category_name, presence: true
  belongs_to :product_holder, polymorphic: true

  before_save :capitalize_name
  # accepts_nested_attributes_for :category

  def capitalize_name
    self.name = name.capitalize
  end

end
