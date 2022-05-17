FactoryBot.define do
  factory :organisation do
    name { Faker::Company.name }
    tagline { Faker::Company.catch_phrase }
    website { Faker::Internet.domain_name(subdomain: true, domain: 'dummy') }
    email { Faker::Internet.email }
    address { association(:address) }
  end
end
