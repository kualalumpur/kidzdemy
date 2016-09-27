class AddDefaultToEventType < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :etype, :integer, default: 0
  end
end
