class ApplicationController < ActionController::API
  before_action :authenticate!

  def authenticate!
    @current_user = Authentication.authenticate_request(request.headers['HTTP_AUTHORIZATION'])
  end
end
