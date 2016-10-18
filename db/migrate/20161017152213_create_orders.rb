class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|

      t.integer :order_number
      t.string :payment_method
      t.decimal :total_price

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

