class TicketSerializer < ActiveModel::Serializer
  # attributes :
  attributes :id
  has_many :ticket_items

end
