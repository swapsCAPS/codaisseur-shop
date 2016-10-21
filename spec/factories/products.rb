FactoryGirl.define do

  factory :product do
    name      { Faker::Pokemon.name }

    description       { Faker::Lorem.sentence(40) }
    #address           { Faker::Address.city }
    price             { Faker::Commerce.price }
    user

    # this works
    # photo belongs to one product
    transient do
      photo_count 1
    end

    after(:build) do |prod, evaluator|
      prod.photos << build_list(:photo, evaluator.photo_count, product: prod)
    end

    # here I copy it for categories
    # category has multiple products
    transient do
      category_count 1
    end

    after(:build) do |prod, evaluator|
      prod.categories << build_list(:category, evaluator.category_count, products: [prod])
    end

  end
end
