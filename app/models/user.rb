class User < ApplicationRecord
  enum gender: {male: 0, female: 1, other: 2}

  has_many :accidents, dependent: :destroy

  scope :phone_is, ->(phone){where "phone == ?", phone}

  validates :email, presence: true, length: {maximum: 255},
    uniqueness: {case_sensitive: false}
  validates :name, presence: true, length: {maximum: 50}
  validates :phone, presence: true
  validates :gender, presence: true
  validates :blood_group, presence: true
  validates :helmet_id, presence: true
  validates :phone_emergency, presence: true
end
