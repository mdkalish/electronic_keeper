class AddTicketRefToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :ticket
  end
end
