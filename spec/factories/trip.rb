FactoryGirl.define do
  factory :trip do
    title { Faker::Lorem.word }
    summary { Faker::ChuckNorris.fact }
    user
  end
end
