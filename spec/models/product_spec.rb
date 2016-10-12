require 'rails_helper'


# here we test our product-category relation in 2 ways (see category_spec.rb for 2 more)
# 1 product has 1 category
# 1 product has multiple categories

# we also check the association of a product with a user

RSpec.describe Product, type: :model do

  describe "association with user" do               # a product needs a user
    let(:user) { create :user }

    it "belongs to a user" do
      product = user.products.new()

      expect(product.user).to eq(user)
    end
  end

  context "product has one category" do

    let(:user1) {create :user}
    let(:category1) { create :category }
    let(:product1) { create :product, user: user1, categories: [category1] }    # one product has many categories, so we need an array categories: [category1]

    it "has category" do
      expect(product1.categories).to eq([category1])
    end
  end

  context "product has multiple categories" do

    let(:user1) {create :user}
    let(:category1) { create :category }
    let(:category2) { create :category }
    let(:product1) { create :product, user: user1, categories: [category1, category2] }

    it "has category" do
      expect(product1.categories).to eq([category1, category2])
    end
  end
end
