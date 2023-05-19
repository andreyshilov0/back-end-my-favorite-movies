# frozen_string_literal: true

class ApplicationController < ActionController::API
  def current_user
    User.find_by(id: 1)
  end
end
