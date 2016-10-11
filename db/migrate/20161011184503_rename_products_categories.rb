class RenameProductsCategories < ActiveRecord::Migration[5.0]
  def change
    rename_table :products_categories, :categories_products
  end
end
