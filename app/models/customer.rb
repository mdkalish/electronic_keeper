class Customer < ActiveRecord::Base
  has_and_belongs_to_many :delivery_addresses
end
