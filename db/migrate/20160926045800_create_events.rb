class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start
      t.datetime :end
      t.string :image
      t.string :address
      t.string :organizer_name
      t.string :organizer_description
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
