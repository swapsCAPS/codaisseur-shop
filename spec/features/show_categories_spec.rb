require 'rails_helper'

# testing navigation from home (categories#index) -> categories/show -> products/show and back to categories/show

describe "Navigating" do

  # before { login_as user }        #these pages are identical for all users

  let!(:user) { create :user }
  let!(:category) { create :category, name: "Nuts" }
  let!(:product) { create :product, name: "Peanut", user: user, categories: [category] }

  context "from category/index page to category/show to product/show and back to category/show" do
    it "is category/show page and product/show and category/show" do

      visit categories_url

          # forth
      click_link "Nuts"

      expect(current_path).to eq(category_path(category.id))

          # forth
      click_link "Peanut"

          # why can't we use the random names automatically created by the factory? --> want to use click_link category.name and product.name...
          # ... its gives error "ActionView::Template::Error: nil is not a valid asset source"

      expect(current_path).to eq(product_path(product))

          # and back once
      #click_link category.name

      #expect(current_path).to eq(category_path(category))
    end
  end

  context "product/show -> category/show" do
    it "" do

      visit product_path(product)

      expect(current_path).to eq(product_path(product))

      click_link category.name

      expect(current_path).to eq(category_path(category))
    end
  end

  context "product/show is there? " do
    it "" do

      visit product_path(product)

      expect(current_path).to eq(product_path(product))

    end
  end
end
