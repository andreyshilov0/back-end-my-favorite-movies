class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  attr_accessor :password_digest

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
    super
  end
  has_secure_password

  has_many :genres
  has_many :favorite_movies

  validates :login, presence: true
  validates :email, presence: true, uniqueness: true
end
