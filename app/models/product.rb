class Product < ActiveRecord::Base
  validates :price, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  before_save :capitalize_name

  def capitalize_name
    self.name = name.capitalize
  end

end
