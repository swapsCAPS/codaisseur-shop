FactoryGirl.define do
  factory :user do
    name      { Faker::Pokemon.name }
    email     { Faker::Internet.email }
    password  { Faker::Internet.password }

    # add a role

  end
end