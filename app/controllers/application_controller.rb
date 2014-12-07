class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def initialize_ticket
    # binding.pry
    if session[:ticket_id]
      @ticket = Ticket.find(session[:ticket_id])
    else
      @ticket = Ticket.create!
      session[:ticket_id] = @ticket.id
    end
  end

  def crement(item, sign)
    if sign == '+'
      item.update_attribute(:amount, @ticket_item.amount + 1)
    elsif sign == '-'
      item.update_attribute(:amount, @ticket_item.amount - 1)
    else
      puts "Invalid operator"
    end
  end

end
