require 'rails_helper'


# here we test our product-category relation in 4 ways
# 1 product has 1 category
# 1 product has multiple categories
# 1 category contains 1 product
# 1 category contains multiple products

RSpec.describe Product, type: :model do

    context "product has category" do

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

    context "product has multiple categories" do

end
