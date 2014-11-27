module ApplicationHelper

  def icon_for(category)
    icon = "left_sidebar/64/#{category}.png"
  end

  def convert_to_pln(number)
    number_to_currency(number, unit:      "zł", separator: ",",
                               delimiter: " ",  format:    "%n %u")
  end

  def button_label_for(product, price)
    "#{product.name} #{convert_to_pln(price)}"
  end

  def ticket_total(product)

  end

end
