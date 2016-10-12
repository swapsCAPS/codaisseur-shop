require 'rails_helper'

# here we test our product-category relation in 2 ways (see product_spec.rb for 2 more)
# 1 category contains 1 product
# 1 category contains multiple products

RSpec.describe Category, type: :model do
  context "category has one product" do
    let(:user1) { create :user }
    let(:product1) { create :product, user: user1 }
    let(:category1) { create :category, products: [product1] }      # same remark as above: we need an array

    it "has category" do
      expect(category1.products).to eq([product1])
    end
  end

  context "category has multiple products" do
    let(:user1) { create :user }
    let(:product1) { create :product, user: user1 }
    let(:product2) { create :product, user: user1 }
    let(:category1) { create :category, products: [product1, product2] }

    it "has category" do
      expect(category1.products).to eq([product1, product2])
    end
  end
end
