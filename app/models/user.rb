class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
    super.merge(id:,
                email:)
  end

  has_many :genres
  has_many :favorite_movies

  validates :email, presence: true, uniqueness: true
end
