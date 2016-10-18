require 'rails_helper'
require 'capybara'

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

  # it "sets the cookie expiration" do
  #
  #   expiring_cookie = stub_cookie_jar['expiring_cookie']
  #   expiring_cookie[:expires].to_i.should be_within(1).of(1.hour.from_now.to_i)
  #
  # end
end