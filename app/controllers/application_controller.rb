# frozen_string_literal: true

class ApplicationController < ActionController::API
  def self.current_user
    User.find_by(id: 1)
    # user1 = User.new(id: 1, login:'Jack')
    # genre1 = Genre.new(id: 1, title: 'Action')
    # data = user1.genres.build
    # binding.pry
  end
end
