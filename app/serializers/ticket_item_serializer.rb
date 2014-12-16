class TicketItemSerializer < ActiveModel::Serializer
  attributes :id, :price
  has_one :product

end
