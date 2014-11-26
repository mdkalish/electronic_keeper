class Product < ActiveRecord::Base
  validates :price, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :category
  before_save :capitalize_name
  accepts_nested_attributes_for :category

  def capitalize_name
    self.name = name.capitalize
  end

end
