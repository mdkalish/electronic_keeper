class Customer < ActiveRecord::Base
  has_and_belongs_to_many :delivery_addresses
  has_many :tickets
  validates :phone_number_1, presence: true, numericality: { only_integer: true}
end
