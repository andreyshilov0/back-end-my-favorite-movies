class User < ApplicationRecord
  devise :database_authenticatable, :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :genres
  has_many :favorite_movies

  validates :email, presence: true, uniqueness: true
end
