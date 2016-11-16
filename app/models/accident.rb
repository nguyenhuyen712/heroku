class Accident < ApplicationRecord
  belongs_to :user

  scope :waiting, ->{where status: false}
end
