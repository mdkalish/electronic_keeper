class Ticket < ActiveRecord::Base
  has_many :products, as: :product_holder
  validates :products, presence: true


end
