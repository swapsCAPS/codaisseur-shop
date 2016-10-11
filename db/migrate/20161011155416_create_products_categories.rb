class CreateProductsCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :products_categories, id: false do |t|
        t.belongs_to :product, index: true
        t.belongs_to :categories, index: true
    end
  end
end
