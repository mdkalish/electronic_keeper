class TicketsController < ApplicationController
  before_filter :initialize_ticket
  skip_before_action :verify_authenticity_token
  # respond_to :json, :js, :html

  def new
    @ticket = Ticket.new
  end

  def index
    # binding.pry
    @tickets = Ticket.all
    respond_to do |format|
      format.html { render html: "<h1>Check #{params[:controller]}.json</h1>".html_safe }
      format.json { render json: @tickets } # root: false
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    @products = @ticket.products
  end

  def create
    @ticket.update_attribute(:status, "underway")
    @ticket.destroy unless @ticket.count_products != 0
    @tickets = Ticket.find_all("underway")
    session[:ticket_id] = nil
    respond_to :js
  end

  def destroy
    Ticket.find(params[:id]).destroy
    respond_to :js
  end

  def edit
    # binding.pry
    @ticket.update_attribute(:status, "underway") unless @ticket.count_products == 0
    @ticket  = Ticket.find(params[:id])
    @tickets = Ticket.find_all("underway")
    session[:ticket_id] = @ticket.id
    render 'tickets/update', format: :js
  end

  def update
    if params[:status] == "closed"
      Ticket.find(params[:id]).update_attribute(:status, params[:status])
      respond_to :js
    end
  end

end
