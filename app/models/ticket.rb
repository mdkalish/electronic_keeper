class Ticket < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  has_many :ticket_items, dependent: :destroy
  has_many :products, through: :ticket_items
  belongs_to :user
  before_save :update_values
  accepts_nested_attributes_for :products

  scope :all_by_date, -> (date) { where("DATE(created_at) = DATE(?)", date) }

  def toggle
    if delivery == true
      update_attribute(:delivery, false)
    else
      update_attribute(:delivery, true)
    end
  end

  def translate_delivery
    delivery == true ? I18n.t('delivery.takeaway') : I18n.t('delivery.home')
  end

  def calculate_total_price
    ticket_items.pluck(:price).inject(0, :+)
  end

  def count_items
    ticket_items.pluck(:amount).inject(0, :+)
  end

  def count_products
    products.count
  end

  def update_values
    self.total_price = calculate_total_price
    self.items_count = count_items
  end

  def time_in_production
    distance_of_time_in_words(self.underwayed_at, self.closed_at)
  end

  def self.search_summary(tickets, date = '')
    total_price = tickets.pluck(:total_price).inject(0, :+)
    total_items = tickets.pluck(:items_count).inject(0, :+)
    tickets_per_user_hash = User.count_tickets_per_user(date)
    # binding.pry
    total_tickets_in_search = tickets_per_user_hash.values.sum
    [total_price, total_items, tickets_per_user_hash, total_tickets_in_search]
  end

  def self.total_turnover
    where("status = ?", "closed").pluck(:total_price).inject(0, :+)
  end

  def self.daily_turnover
    where("DATE(created_at) = DATE(:date) and status = :status", { date: Date.today, status: "closed" }).pluck(:total_price).inject(0, :+)
  end

  def self.total_tickets(status)
    where("status = ?", status).count
  end

  def self.daily_tickets(status)
    where("DATE(created_at) = DATE(?)", Date.today).where(status: status).count
  end

  def self.tickets_summary
    Hash["underway_tickets", total_tickets("underway"),
         "open_tickets",     total_tickets("open"),
         "closed_tickets",   total_tickets("closed"),
         "daily_turnover",   daily_turnover]
  end

  def self.find_all(status)
    where("status = ?", status).to_a
  end

  def self.how_many_today
    where("DATE(created_at) = DATE(?)", Date.today).count
  end

end
