require 'active_support/concern'

module Concerns::SessionHandler
  extend ActiveSupport::Concern

  included do
    has_secure_token :auth_token
  end

  def logout
    regenerate_auth_token
  end
end