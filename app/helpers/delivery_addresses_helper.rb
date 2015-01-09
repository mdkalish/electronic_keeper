module DeliveryAddressesHelper

  def style_delivery_address_for(ticket)
    delivery_address = DeliveryAddress.find(ticket.delivery_address_id)
    city = delivery_address.city.titleize
    street = delivery_address.street.titleize
    house_nr = delivery_address.house_number
    flat_nr = delivery_address.flat_number
    name = delivery_address.name.try(:titleize) || ""
    # binding.pry
    styled_address = "#{name} #{city}, #{street} #{house_nr}"
    flat_nr.empty? ? styled_address : styled_address + "/#{flat_nr}"
  end

end
