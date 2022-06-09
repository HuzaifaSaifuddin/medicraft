FactoryBot.define do
  factory :patient do
    salutation { Patient::SALUTATIONS.sample }
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    gender { Patient::GENDERS.sample }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    mobile_number { Faker::Number.number(digits: 10) }
    email { Faker::Internet.email }
    blood_group { Patient::BLOODGROUPS.sample }
    organisation { association(:organisation) }
  end
end
