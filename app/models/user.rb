class User < ApplicationRecord
  include BCrypt
  has_secure_token :auth_token
  
  validates :email, :password_hash, presence: true

  has_many :link_users

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end