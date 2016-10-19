require 'rails_helper'

# TODO something wrong with either the filename or the describe or whatever. If you run the single blocks of it "" do they will pass! The whole file won't pass

# testing navigation from home (categories#index) -> categories/show -> products/show and back to categories/show

describe "Navigating" do

  let!(:user) { create :user }
  let!(:category) { create :category, name: "Nuts", products: [] }

  # the views needs a photo. Else we get an error

  # photo1 = Photo.create(image: Faker::Avatar.image("my-own-slug", "50x50"))


  let!(:product) { create :product, name: "Peanut", user: user, categories: [category] }
  let!(:photo) { create :photo, product: product }

  context "from category/index page --> category/show --> product/show --> category/show" do
    it "is category/show page " do

      visit categories_url

      click_link "Nuts"

      expect(page).to have_current_path(category_path(category))

    end

    it "is product/show" do

      visit(category_path(category))

      click_link "Learn More"

      # problem: when it loads the products path: not method error for image
      expect(page).to have_current_path(product_path(product))
    end

    it "and category/show" do

      visit(product_path(product))

      click_link "Nuts"

      # problem: when it loads the products path: not method error for image
      expect(page).to have_current_path(category_path(category))


    end
  end
end
