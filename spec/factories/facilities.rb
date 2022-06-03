FactoryBot.define do
  factory :facility do
    name { Faker::Company.name }
    abbreviation { Faker::Hacker.abbreviation }
    contact_number { Faker::Number.number(digits: 10) }
    email { Faker::Internet.email }
    fax_number { Faker::Number.number(digits: 10) }
    address { association(:address) }
    organisation { association(:organisation) }
  end
end
