FactoryGirl.define do

  factory :room do
    #home_type         "House"
    #room_type         "Shared"
    #accommodate       2
    #bedroom_count     2
    #bathroom_count    3
    #listing_name      { Faker::Lorem.sentence(2) }
    #description       { Faker::Lorem.sentence(40) }
    #address           { Faker::Address.city }
    #has_tv            true
    #has_kitchen       true
    #has_airco         true
    #has_heating       true
    #has_internet      true
    #price             { Faker::Commerce.price }           { Faker::Commerce.price }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end