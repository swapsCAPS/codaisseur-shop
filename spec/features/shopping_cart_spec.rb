require 'rails_helper'
require 'capybara'

# add product to shopping cart -> shopping-cart-page ->  results

describe "Navigating" do

  let ( :user ) { create :user }
  let ( :category ) { create :category, name: Faker::Pokemon.name, products: [] }
  let ( :product ) { create :product, name: Faker::Pokemon.name , user: user, categories: [category] }
  let!( :photo ) { create :photo, product: product }

  it "adds to cart" do

    visit product_path(product)

    Capybara.using_session("Bob's session") do

      page.find('#add-to-cart').click

      # find_link(class: ['btn', 'btn-default', 'add-to-cart'], :visible => :all).visible?

      expect(session[:shopping_cart]).to have_content(product.id)
    end
  end
end