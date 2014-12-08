class TicketsController < ApplicationController
  before_filter :initialize_ticket
  skip_before_action :verify_authenticity_token

  def new
    @ticket = Ticket.new
  end

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
    @products = @ticket.products
  end

  def create
    # binding.pry
    @ticket = Ticket.find(session[:ticket_id])
    @ticket.update_attribute(:status, "underway")
    @ticket.products.count == 0 ? @ticket.destroy : @ticket.save
    @tickets = Ticket.where("status = ?", "underway").to_a
    session.destroy
    respond_to :js
  end

  def destroy
    Ticket.find(params[:id]).destroy
    head :ok
  end

  def update
    if params[:data].present?
      Ticket.find(params[:id]).update_attribute(:status, params[:data][:status])
      head :ok
    else
      # binding.pry
      @ticket = Ticket.find(params[:id])
      if session[:ticket_id].present?
        t = Ticket.find(session[:ticket_id])
        t.products.count == 0 ? t.destroy : t.update_attribute(:status, "underway")
      end
      @tickets = Ticket.where("status = ?", "underway").to_a
      session[:ticket_id] = @ticket.id
      respond_to :js
    end
  end

end
