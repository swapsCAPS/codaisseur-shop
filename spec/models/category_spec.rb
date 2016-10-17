require 'rails_helper'

# here we test our product-category relation in 3 ways (see product_spec.rb for 2 more)
# 1 category has NO products
# 1 category contains 1 product
# 1 category contains multiple products

RSpec.describe Category, type: :model do

  context "category has NO product" do
    let(:user1) {create :user }

    let(:category1) { create :category, products: []}      # same remark as below: we need an array

    it "has NO product" do
      expect(category1.products).to eq([])
    end
  end

  context "category has one product" do
    let(:user1) {create :user}
    let(:product1) { create :product, user: user1 }
    let(:category1) { create :category, products: [product1] }      # one category has many products, so we need an array products: [product1]

    it "has category" do
      expect(category1.products).to eq([product1])
    end
  end

  context "category has multiple products" do
    let(:user1) {create :user}
    let(:product1) { create :product, user: user1 }
    let(:product2) { create :product, user: user1 }
    let(:category1) { create :category, products: [product1, product2] }

    it "has category" do
      expect(category1.products).to eq([product1, product2])
    end
  end
end