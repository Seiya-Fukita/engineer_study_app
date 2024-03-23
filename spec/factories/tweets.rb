FactoryBot.define do
  factory :tweet do
    association :user
    content { Faker::Content.content }
  end
end
