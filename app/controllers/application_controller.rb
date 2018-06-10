class ApplicationController < ActionController::API
  include Concerns::CurrentUserFinder
end
