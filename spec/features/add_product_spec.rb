require 'rails_helper'
require 'capybara'

feature 'Add product', js: true do
    let ( :photo ) { create :photo, image: "bla" }
    let ( :category ) { create :category, name: Faker::Pokemon.name, products: [] }
  scenario 'add a product' do

    visit new_product_path

    fill_in 'product_name', with: 'Automatic website builder'
    fill_in 'product_description', with: 'Teh awesome description'
    fill_in 'product_price', with: 10
    fill_in 'product_category_ids', with: [ category.id ]
    fill_in 'product_photos_ids', with: [ photo.id ]

  end
end
