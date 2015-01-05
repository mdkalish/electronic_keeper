module ApplicationHelper

  def init_tickets(status)
    @tickets = Ticket.where("status = ?", status).to_a
  end

  def init_ticket(status = "")
    @ticket = Ticket.find_or_initialize_by(status: status) || Ticket.last
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
    id = "#{ticket.id}(#{ticket.todays_nr})"
    price = convert_to_pln(ticket.calculate_total_price)
    text = "Zamówienie nr #{id}:<br />#{ticket.count_items} rzeczy za #{price.to_f}".html_safe
    # binding.pry
    content_tag(:h3, text, :id => id, 'data-ticket-price' => price)
  end

  def daily_turnover
    daily_turnover = Ticket.daily_turnover
    text = "#{t('daily_turnover').capitalize}: #{daily_turnover}"
    content_tag(:span, text, 'data-daily-turnover' => daily_turnover)
  end

  def total_tickets(status)
    count = Ticket.total_tickets(status)
    text = "#{status.capitalize} tickets: #{count}"
    content_tag(:span, text, "data-#{status}-tickets" => count)
  end

  def daily_tickets(status)
    count = Ticket.daily_tickets(status)
    text = t("ticket.#{status}").capitalize + " #{t('ticket.tickets')}: #{count}"
    content_tag(:span, text, "data-#{status}-tickets" => count)
  end

  def ticket_search_summary(tickets, date)
    date = t('search.all') unless !date.nil?
    tss = Ticket.search_summary(tickets, date)
    total_items = tss[1]
    tickets_per_user_hash = tss[2]
    t('search.summary', total_price: number_to_currency(tss[0]),
                        total_tickets_in_search: tss[3],
                        date: date)
  end

end
