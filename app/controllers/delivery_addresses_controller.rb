class DeliveryAddressesController < ApplicationController
  before_filter :initialize_ticket

  def index
  end

  def new
    @delivery_address = DeliveryAddress.new
    respond_to :js
  end

  def create
    pn = params[:phone_number]
    @customer = Customer.where("phone_number_1 = :pn OR phone_number_2 = :pn", { pn: pn })[0] || Customer.create!(phone_number_1: pn)
    da = @customer.delivery_addresses.find_or_create_by!(delivery_address_params)
    # binding.pry
    @ticket.update!(delivery_address_id: da.id)
    respond_to :js
  end

  private

    def delivery_address_params
      params.require(:delivery_address).permit(:city, :street, :house_number, :flat_number)
    end

end
