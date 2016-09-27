class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.integer :ttype
      t.integer :quantity
      t.float :price
      t.integer :event_id

      t.timestamps
    end
  end
end
