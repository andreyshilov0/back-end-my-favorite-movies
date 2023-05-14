class FavoriteMovie < ApplicationRecord
  belongs_to :user, optional: true
end
