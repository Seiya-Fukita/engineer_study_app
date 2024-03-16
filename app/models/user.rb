class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_URL_REGEX = /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/

  with_options presence: true do
    validates :name, length: {maximum: 50}
    validates :identification_name, length: {maximum: 50}, uniqueness: true
    validates :birth_date
    validates :email, length: {maximum: 255}, uniqueness: true,
      format: {with: VALID_EMAIL_REGEX}
  end
  validates :website, format: {with: VALID_URL_REGEX}, allow_blank: true

  before_save { email.downcase! }
end
