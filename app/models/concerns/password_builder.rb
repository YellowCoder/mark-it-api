require 'active_support/concern'

module Concerns::PasswordBuilder
  extend ActiveSupport::Concern
  include BCrypt

  included do
    has_secure_token :auth_token
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end