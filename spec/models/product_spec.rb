require 'rails_helper'


# here we test our product-category relation in 3 ways (see category_spec.rb for 2 more)
# 1 product has NO category
# 1 product has 1 category
# 1 product has multiple categories

# we also first check the association of a product with a user

RSpec.describe Product, type: :model do

  context "product has category" do

    let(:user) { create :user }
    let(:category) { create :category }


    it "has NO category" do
      product1 = Product.new( user: user, categories: [] )

      product1.valid?
      expect(product1.errors).to have_key(:categories)

      product2 = Product.new( user: user )
      product2.valid?
      expect(product2.errors).to have_key(:categories)
    end
  end


  context "association with user" do               # a product needs a user
    let(:user) { create :user }

    it "belongs to a user" do
      product = user.products.new()

      expect(product.user).to eq(user)
    end
  end

  context "product has one category" do

    let(:user) {create :user}
    let(:category) { create :category }
    let(:product) { create :product, user: user, categories: [category] }    # one product has many categories, so we need an array categories: [category1]

    it "has category" do

      expect(product.categories).to include(category)
    end
  end

  context "product has multiple categories" do

    let(:user1) {create :user}
    let(:category1) { create :category }
    let(:category2) { create :category }
    let(:product) { create :product, user: user1, categories: [category1, category2] }

    it "has category" do
      expect(product.categories).to include(category1,
                                            category2)
    end
  end

  # here come the validations !!!

  context "validations" do
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
