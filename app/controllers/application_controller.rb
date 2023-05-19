# frozen_string_literal: true

class ApplicationController < ActionController::API
  def self.current_user
    User.find_by(id: 1)
  end
end
