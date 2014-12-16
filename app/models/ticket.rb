class Ticket < ActiveRecord::Base
  has_many :ticket_items, dependent: :destroy
  has_many :products, through: :ticket_items
  before_save :update_values
  accepts_nested_attributes_for :products

  def calculate_total_price
    ticket_items.map(&:price).inject(0, :+)
  end

  def count_items
    ticket_items.map(&:amount).inject(0, :+)
  end

  def count_products
    products.count
  end

  def update_values
    self.total_price = calculate_total_price
    self.items_count = count_items
  end

  def self.daily_turnover
    Ticket.all.where("status = ?", "closed").to_a.map(&:total_price).inject(0, :+)
  end

  def self.total_tickets(status)
    Ticket.all.where("status = ?", status).count
  end

  def self.tickets_summary
    Hash["underway_tickets", total_tickets("underway"),
         "open_tickets",     total_tickets("open"),
         "closed_tickets",   total_tickets("closed"),
         "daily_turnover",   daily_turnover]
  end

  def self.find_all(status)
    Ticket.all.where("status = ?", status).to_a
  end

end
