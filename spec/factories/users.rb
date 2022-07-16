FactoryBot.define do
  factory :user do
    salutation { User::SALUTATIONS.sample }
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    gender { User::GENDERS.sample }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    mobile_number { Faker::Number.number(digits: 10) }
    email { Faker::Internet.email }
    password { 'Medicraft@12' }
    address { association(:address) }
    organisation { association(:organisation) }
  end
end
