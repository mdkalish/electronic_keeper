class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  include SessionsHelper
  before_action :require_login
  before_action :set_locale

  def initialize_ticket
    # binding.pry
    @ticket = current_user.tickets.find_by_id(session[:ticket_id] || params[:id])
    if @ticket.nil?
      @ticket = current_user.tickets.find_by_status("open") || current_user.tickets.create!
      session[:ticket_id] = @ticket.id
      @ticket.update!(todays_nr: Ticket.how_many_today) if @ticket.todays_nr == nil
    end
  end

  def initialize_ticket_item
    # binding.pry
    @product = Product.find(params[:id])
    @ticket_item = current_user.tickets.find(session[:ticket_id]).ticket_items.find_or_create_by(product_id: @product.id)
  end

  def initialize_current_tickets
    @tickets = Ticket.find_all("underway")
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # def default_url_options
  #   { I18n.locale => :pl }
  # end

  private

    def require_login
      unless logged_in?
        flash[:danger] = t('flash.you_must_be_logged_in')
        redirect_to login_path # halts request cycle
      end
    end

end
