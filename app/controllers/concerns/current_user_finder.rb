module Concerns::CurrentUserFinder
  extend ActiveSupport::Concern
  include ActionController::Helpers

  included do
    helper_method :current_user
  end

  def current_user
    @current_user ||= User.find_by(auth_token: params[:auth_token])
  end
end