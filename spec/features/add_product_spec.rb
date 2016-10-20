require 'rails_helper'
require 'capybara'

feature 'Add product', js: true do
    before { login_as user }

    let ( :user) { create :user, email: "host@user.com" }
    let! ( :photo ) { create :photo, image: "bla" }
    let! ( :category ) { create :category, name: "A category", products: [] }
  scenario 'add a product' do

    visit new_product_path

    fill_in 'product_name', with: 'Automatic website builder'
    fill_in 'product_description', with: 'Teh awesome description'
    fill_in 'product_price', with: 10

  end
end
