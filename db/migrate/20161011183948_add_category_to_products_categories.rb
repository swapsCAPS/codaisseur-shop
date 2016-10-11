class AddCategoryToProductsCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :products_categories, :category, foreign_key: true
  end
end
