class User < ApplicationRecord
  validates :login, :password, presence: true, uniqueness: true
end
