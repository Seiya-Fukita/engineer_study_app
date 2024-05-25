class OneTimePassword < ApplicationRecord
  belongs_to :user


  def self.generate_password(user)
    one_time_password = create!(user:, password: rand(000000..999999), expired_at: Time.current + 60 * 60 * 2)
    one_time_password.password
  end
end
