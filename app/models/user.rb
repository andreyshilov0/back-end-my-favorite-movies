# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :favorite_movies
  belongs_to :genres
  
  validates :login, presence: true, uniqueness: true
  
end
