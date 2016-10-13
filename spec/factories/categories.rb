FactoryGirl.define do
  factory :category do
    name    { Faker::Internet.name }
  end
end