FactoryBot.define do
  factory :role do
    doctor

    trait :doctor do
      name { 'doctor' }
    end

    trait :owner do
      name { 'owner' }
    end

    trait :admin do
      name { 'admin' }
    end

    trait :receptionist do
      name { 'receptionist' }
    end
  end
end
