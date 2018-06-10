class ApplicationController < ActionController::API
  include Concerns::CurrentUserFinder
  include Concerns::Authentication
end
