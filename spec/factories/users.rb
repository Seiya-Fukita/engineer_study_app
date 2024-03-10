FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Alphanumeric.unique.alpha(number: 10) }
    email { Faker::Internet.unique.email }
    birth_date { Faker::Date.birthday }
  end
end
