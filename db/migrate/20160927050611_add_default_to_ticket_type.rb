class AddDefaultToTicketType < ActiveRecord::Migration[5.0]
  def change
    change_column :tickets, :ttype, :integer, default: 0
  end
end
