class Product < ActiveRecord::Base
  belongs_to :category, inverse_of: :products
  has_many :ticket_items
  has_many :tickets, through: :ticket_items
  validates :price, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :category_name, presence: true
  # before_save :capitalize_name
  # accepts_nested_attributes_for :category

  def capitalize_name
    self.name = name.capitalize
  end

end
