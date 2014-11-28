class Ticket < ActiveRecord::Base
  has_many :products
  validates :products, presence: true


end
