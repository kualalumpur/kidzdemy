class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :user_id
      t.integer :ticket_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
