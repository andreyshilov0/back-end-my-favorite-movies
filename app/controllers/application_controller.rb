class ApplicationController < ActionController::API
  before_action :authenticate!

  def authenticate!
    Authentication.authenticate_request(request.headers['HTTP_AUTHORIZATION'])
  end
end
