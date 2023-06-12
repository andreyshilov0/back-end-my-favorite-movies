class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include AuthenticableUser
end
