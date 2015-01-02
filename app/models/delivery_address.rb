class DeliveryAddress < ActiveRecord::Base
  has_and_belongs_to_many :customers
  validates :street, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
end
