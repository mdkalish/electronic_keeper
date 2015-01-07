module DeliveryAddressesHelper

  def style_delivery_address_for(ticket)
    delivery_address = DeliveryAddress.find(ticket.delivery_address_id)
    city = delivery_address.city.titleize
    street = delivery_address.street.titleize
    house_nr = delivery_address.house_number
    flat_nr = delivery_address.flat_number
    flat_nr.nil? ? "#{city}, #{street} #{house_nr}" : "#{city}, #{street} #{house_nr}/#{flat_nr}"
  end

end
