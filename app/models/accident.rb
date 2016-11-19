class Accident < ApplicationRecord
  belongs_to :user

  enum status: {waiting: 0, processing: 1, done: 2}

  scope :order_desc, ->{order created_at: :desc}
  scope :user_exist, ->(user_id) {where("user_id = ?", user_id)}
  scope :waiting_or_processing, ->{where("status != ?", 2)}
end
