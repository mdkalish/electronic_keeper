class Ticket < ActiveRecord::Base
  has_many :ticket_items, dependent: :destroy
  has_many :products, through: :ticket_items
  belongs_to :user
  before_save :update_values
  accepts_nested_attributes_for :products

  def toggle
    if delivery == true
      update_attribute(:delivery, false)
    else
      update_attribute(:delivery, true)
    end
  end

  def translate_delivery
    delivery == true ? "Na wynos" : "Na miejscu"
  end

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

  def self.total_turnover
    Ticket.where("status = ?", "closed").to_a.map(&:total_price).inject(0, :+)
  end

  def self.daily_turnover
    Ticket.where("DATE(created_at) = DATE(:date) and status = :status", { date: Date.today, status: "closed" }).map(&:total_price).inject(0, :+)
  end

  def self.total_tickets(status)
    Ticket.where("status = ?", status).count
  end

  def self.daily_tickets(status)
    Ticket.where("DATE(created_at) = DATE(?)", Date.today).where(status: status).count
  end

  def self.tickets_summary
    Hash["underway_tickets", total_tickets("underway"),
         "open_tickets",     total_tickets("open"),
         "closed_tickets",   total_tickets("closed"),
         "daily_turnover",   daily_turnover]
  end

  def self.find_all(status)
    Ticket.where("status = ?", status).to_a
  end

  def self.how_many_today
    Ticket.where("DATE(created_at) = DATE(?)", Date.today).count
  end

  # This method is scheduled with cron; check config/schedule.rb
  def self.reset_todays_nr
    @@todays_nr = nil
  end

  def self.set_todays_nr
    # if @@todays_nr.nil?
    if Ticket.last.created_at.to_date != Date.today or defined?(@@todays_nr).nil?
      @@todays_nr = 1
    else
      @@todays_nr += 1
    end
  end


end
