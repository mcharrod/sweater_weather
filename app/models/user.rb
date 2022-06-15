class User < ApplicationRecord

  validates_presence_of :email
  validates_uniqueness_of :email

  validates_presence_of :password_digest

  has_secure_password

  def assign_api_key
    self.api_key ||= SecureRandom.hex(13)
  end
end
