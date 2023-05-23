class User < ApplicationRecord
  has_many :genres
  has_many :favorite_movies

  validates :login, presence: true, uniqueness: true
end
