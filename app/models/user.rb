class User < ApplicationRecord
  include Concerns::PasswordHandler
  include Concerns::SessionHandler

  # Relationship
  has_many :link_users

  # Validations
  validates :email, :password_hash, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end