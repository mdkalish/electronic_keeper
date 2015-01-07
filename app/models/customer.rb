class Customer < ActiveRecord::Base
  has_and_belongs_to_many :delivery_addresses
  has_many :tickets
  validates :phone_number_1, presence: true
  # accepts_nested_attributes_for :delivery_addresses
end
