class Product < ActiveRecord::Base
  validates :price, presence: true
  validates :name, presence: true #, uniqueness: { case_sensitive: false }
  validates :category_name, presence: true
  validates :product_holder_type, presence: true
  validates :product_holder_id, presence: true
  # belongs_to :product_holder, polymorphic: true
  before_save :capitalize_name
  has_many :ticket_items
  has_many :tickets, through: :ticket_items
  # accepts_nested_attributes_for :category

  def capitalize_name
    self.name = name.capitalize
  end

end
