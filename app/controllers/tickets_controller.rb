class TicketsController < ApplicationController
  require 'prawn'
  before_filter :initialize_ticket
  skip_before_action :verify_authenticity_token
  # respond_to :json, :js, :html

  def new
    @ticket = Ticket.new
  end

  def index
    # binding.pry
    @tickets = Ticket.all
    # respond_to do |format|
    #   format.html { render html: "<h1>Check #{params[:controller]}.json</h1>".html_safe }
    #   format.json { render json: @tickets } # root: false
    # end
  end

  def show
    @ticket = Ticket.find(params[:id])
    @products = @ticket.products
  end

  def create
    if @ticket.underwayed_at == nil
      @ticket.update(underwayed_at: Time.now)
    end
    @ticket.count_products != 0 ? @ticket.update(status: "underway") : @ticket.destroy
    @tickets = Ticket.find_all("underway")
    session[:ticket_id] = nil
    respond_to :js
  end

  def destroy
    Ticket.find(params[:id]).destroy
    respond_to :js
  end

  def edit
    @ticket.update!(status: "underway") unless @ticket.count_products == 0
    @ticket.update!(underwayed_at: Time.now.localtime) unless @ticket.underwayed_at != nil
    @ticket  = Ticket.find(params[:id])
    @tickets = Ticket.find_all("underway")
    session[:ticket_id] = @ticket.id
    render 'tickets/update', format: :js
  end

  def update
    if params[:status] == "closed"
      Ticket.find(params[:id]).update(status: params[:status], closed_at: Time.now)
    end
    if params[:delivery]
      @ticket.toggle
    end
    respond_to :js
  end

end
