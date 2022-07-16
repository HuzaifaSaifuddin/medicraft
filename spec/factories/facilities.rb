FactoryBot.define do
  factory :facility do
    name { Faker::Company.name }
    display_name { Faker::Company.name }
    contact_number { Faker::Number.number(digits: 10) }
    email { Faker::Internet.email }
    fax_number { Faker::Number.number(digits: 10) }
    address { association(:address) }
    organisation { association(:organisation) }
  end
end
