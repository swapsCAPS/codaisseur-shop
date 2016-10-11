class ResetDb < ActiveRecord::Migration[5.0]
  def change
    drop_table :products
    drop_table :categories
    drop_table :sellers
  end
end
