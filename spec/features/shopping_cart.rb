require 'rails_helper'

# add product to shopping cart -> shopping-cart-page ->  results

describe "Navigating" do

  let ( :user ) { create :user }
  let ( :product ) { create :product, user: user }

  it "adds to cart" do

    visit product_path(product)

    Capybara.using_session("Bob's session") do

      click_link "Add to cart"

      expect(session[:shopping_cart]).to have_content(product.id)

    end
  end
end