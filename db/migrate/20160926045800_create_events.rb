class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :datetime
      t.string :image
      t.string :venue
      t.string :type
      t.integer :category_id
      t.integer :user_id
      t.integer :ticket_limit

      t.timestamps
    end
  end
end
