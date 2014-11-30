class SetDefaultTicketStatusToOpen < ActiveRecord::Migration
  def change
    change_column_default :tickets, :status, "open"
  end
end
