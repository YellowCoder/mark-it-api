class User < ApplicationRecord
  include Concerns::PasswordBuilder
  
  validates :email, :password_hash, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  has_many :link_users
end