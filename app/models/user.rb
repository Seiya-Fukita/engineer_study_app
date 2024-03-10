class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :username, length: { maximum: 50 }, uniqueness: true
    validates :birth_date
    validates :email, length: { maximum: 255 }, uniqueness: true,
                      format: { with: VALID_EMAIL_REGEX }
  end

  before_save { email.downcase! }
end
