# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email      { Faker::Internet.email }

    factory :customer_with_birthday do
      birthday { (rand(10000) + 5000).days.ago }
    end

    factory :blank_customer do
      first_name nil
      last_name nil
      email nil
    end
  end
end
