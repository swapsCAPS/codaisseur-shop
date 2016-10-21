require 'rails_helper'
require 'capybara'

feature 'Search product', js: true do

  let ( :user ) { create :user, email: "some@email.com" }
  let ( :profile ) { create :profile, user: user }
  let! ( :product ) { create :product, name: "How to build a website", user: user }
  let!( :category ) { create :category, name: "A category", products: [product] }

  scenario 'search a product' do
    visit root_path

    sleep(5)

    click_link("#navbar-collapse-3 > ul > li:nth-child(4) > a")
    fill_in 'search', with: 'build'

    click_button('#nav-collapse3 > form > button > span')

    sleep(5)

  end
end
