FactoryBot.define do
  factory :address do
    line_one { Faker::Address.street_name }
    line_two { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    pincode { Faker::Address.zip_code }
  end
end
