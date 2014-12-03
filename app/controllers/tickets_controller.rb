class TicketsController < ApplicationController
  before_filter :initialize_ticket


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
    @ticket = Ticket.find(session[:ticket_id])
    @ticket.update_attribute(:status, "underway")
    @ticket.save
    @tickets = Ticket.where("status = ?", "underway").to_a
    session.destroy
    respond_to :js
  end

  # def prepare
  #   @ticket = Ticket.last
  #   if @ticket.status != "open"
  #     @ticket = Ticket.create!
  #   end
  #   # binding.pry
  #   p '-----------------'
  #   p @ticket
  #   p '-----------------'
  #   @ticket.products<<(Product.find(params[:id]))
  #   p '-----------------'
  #   p @ticket
  #   p '-----------------'
  #   # binding.pry
  #   respond_to :js
  # end

  def remove_product_from_ticket
  end

  private

    # def ticket_params
    #   params.require(:ticket).permit(:total_price, :items_count,
    #                                  :alcohol, :to_be_served_at,
    #                                  :delivery_address, :created_by,
    #                                  :ordered_by, :status,
    #                                  :created_at)
    # end

end
