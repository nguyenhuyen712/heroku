class User < ApplicationRecord
  enum gender: {other: 2, female: 1, male: 0}

  has_many :accidents, dependent: :destroy

  validates :email, presence: true, length: {maximum: 255},
    uniqueness: {case_sensitive: false}
  validates :name, presence: true, length: {maximum: 50}
end
