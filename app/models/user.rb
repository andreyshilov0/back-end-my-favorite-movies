# frozen_string_literal: true

class User < ApplicationRecord
  validates :login, :password, presence: true, uniqueness: true
end
