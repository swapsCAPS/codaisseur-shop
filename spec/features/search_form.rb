require 'rails_helper'

# shopping-cart-page -> fill in search form faker pokemon -> no results
# shopping-cart-page -> fill in search form product.name -> yes results

describe "Navigating" do

  let ( :user ) { create :user }
  let ( :product ) { create :product, user: user }

  it "fills in form and has NO results" do

    visit shopping_carts_url

    click_link "Search"

    fill_in("Search", with: "pikachu" )

    page.should have_selector("input[type=submit][value='pikachu']")

  end

  it "fills in form and has YES results" do

  end
end