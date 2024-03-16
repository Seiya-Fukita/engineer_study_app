class Tweet < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validate :content, presence: true, length: {maximum: 140}
end
