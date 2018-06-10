module Concerns::Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authentication_check
  end

  def authentication_check
    return if current_user.present?
    render nothing: true, status: :unauthorized
  end
end