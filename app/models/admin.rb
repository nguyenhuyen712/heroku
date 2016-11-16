class Admin < ApplicationRecord
  has_secure_password

  def remember
    self.remember_token = Admin.new_token
    update_attributes remember_digest: Admin.digest(remember_token)
  end

  def forget
    update_attributes remember_digest: nil
  end
end
