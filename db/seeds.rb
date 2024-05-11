5.times do
  User.create!(name: Faker::Name.name, identification_name: Faker::Alphanumeric.unique.alpha(number: 10), email: Faker::Internet.unique.email, birth_date: Faker::Date.birthday, password: "password", password_confirmation: "password")
end

User.all.each do |user|
  5.times do
    Tweet.create!(user:, content: Faker::Lorem.paragraph)
  end
end
