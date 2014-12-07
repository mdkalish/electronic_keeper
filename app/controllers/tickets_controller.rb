class TicketsController < ApplicationController
  before_filter :initialize_ticket
  skip_before_action :verify_authenticity_token
  # protect_from_forgery except: [:destroy, :create, :show]
  # skip_before_filter :verify_authenticity_token

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
    @ticket.save
    @tickets = Ticket.where("status = ?", "underway").to_a
    session.destroy
    respond_to :js
  end

  def destroy
    Ticket.find(params[:id]).destroy
    head :ok
  end

  def update
    if !params[:data].blank?
      Ticket.find(params[:id]).update_attribute(:status, params[:data][:status])
      head :ok
    else
      @ticket = Ticket.find(params[:id])
      session[:ticket_id] = @ticket.id
      render "ticket_items/create", format: :js
      # respond_to :js
      # respond_to do |format|
      #   format.js { render "ticket_items/create" }
      # end
    end
  end

end
