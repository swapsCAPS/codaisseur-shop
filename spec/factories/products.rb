FactoryGirl.define do

  factory :product do
    name      { Faker::Pokemon.name }

    description       { Faker::Lorem.sentence(40) }
    #address           { Faker::Address.city }
    price             { Faker::Commerce.price }
    user

    transient do
      photo_count 1
    end

    after(:build) do |prod, evaluator|
      prod.photos << build_list(:photo, evaluator.photo_count, product: prod)
    end

  end
end