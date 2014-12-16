module ApplicationHelper

  def init_tickets
    @tickets = Ticket.all.where("status = ?", "underway").to_a
  end

  def init_ticket(status = "")
    @ticket = Ticket.find_or_initialize_by(status: status)
  end

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

  def current_ticket_summary(ticket)
    id = ticket.id
    price = convert_to_pln(ticket.calculate_total_price)
    text = "Zamówienie nr #{id}: #{ticket.count_items} rzeczy za #{price.to_f}"
    # binding.pry
    content_tag(:span, text, :id => id, 'data-ticket-price' => price)
  end

  def daily_turnover
    daily_turnover = Ticket.all.where("status = ?", "closed").to_a.map(&:total_price).inject(0, :+)
    text = "Daily turnover: #{daily_turnover}"
    content_tag(:span, text, 'data-daily-turnover' => daily_turnover)
  end

  def total_tickets(status)
    count = Ticket.all.where("status = ?", status).count
    text = "#{status.capitalize} tickets: #{count}"
    content_tag(:span, text, "data-#{status}-tickets" => count)
  end

end
