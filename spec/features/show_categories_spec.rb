require 'rails_helper'

# testing navigation from home (categories#index) -> categories/show -> products/show and back to categories/show

describe "Navigating" do

  # before { login_as user }        #these pages are identical for all users

  let(:user) { create :user }
  let!(:category) { create :category }
  let!(:product) { create :product, user: user, category: category }

  context "from category/index page to the category/show" do
    it "is category/show page" do

      visit categories_url

      click_link category.name

      expect(current_path).to eq(category_path)
    end
  end
end
