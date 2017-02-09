FactoryGirl.define do
  factory :location do
    address { Faker::Address.street_address }
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
    description { Faker::Lorem.paragraph }
    start_date { Faker::Date.between(1.month.ago, 5.days.ago) }
    end_date { Faker::Date.between(5.days.ago, Date.today) }
    user
  end
end
