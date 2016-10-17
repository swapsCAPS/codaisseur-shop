require 'rails_helper'


# here we test our product-category relation in 3 ways (see category_spec.rb for 2 more)
# 1 product has NO category
# 1 product has 1 category
# 1 product has multiple categories

# we also first check the association of a product with a user

RSpec.describe Product, type: :model do

  context "product has NO category" do
    let(:user1) {create :user}

    let(:product1) { create :product, user: user1, categories: [] }      # same remark as below: we need an array

    it "has 1 category" do
      expect(product1.categories).to eq([])
    end
  end


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

  # here come the validations !!!

  describe "validations" do
    it "is invalid without a name" do
      product = Product.new()      # name: ""
      product.valid?
      expect(product.errors).to have_key(:name)
    end

    it "is invalid with a name longer than 50 characters" do
      product = Product.new(name: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. ")
      product.valid?
      expect(product.errors).to have_key(:name)
    end

    it "is invalid without a price" do
      product = Product.new()
      product.valid?
      expect(product.errors).to have_key(:price)
    end

    context "is associated to user" do

      let(:user) { create :user }

      it "is invalid without a user_id!" do
        product = Product.new()
        product.valid?
        expect(product.errors).to have_key(:price)
      end

      it "is valid with a user_id" do
        product = user.products.new
        product.valid?
        expect(product.errors).not_to have_key(:user_id)          #
        expect(product.errors).not_to have_key(:product)          # this is how it's done in codaiseurbnb in rooms_spec.rb:49   BUT WHY?
      end
    end








  end
end
