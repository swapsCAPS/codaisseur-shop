class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :home_type
      t.string :room_type
      t.integer :accommodate
      t.integer :bedroom_count
      t.integer :bathroom_count
      t.string :listing_name
      t.text :description
      t.string :address
      t.boolean :has_tv
      t.boolean :has_kitchen
      t.boolean :has_airco
      t.boolean :has_heating
      t.boolean :has_internet
      t.decimal :price
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
