FactoryBot.define do
  factory :appointment do
    scheduling_date { Date.current }
    scheduling_time { Time.current }
    appointment_date { Date.current }
    appointment_time { Time.current }
    consultant { association(:user) }
    user { association(:user) }
    facility { association(:facility) }
    organisation { association(:organisation) }
  end
end
