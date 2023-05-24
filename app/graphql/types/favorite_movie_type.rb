module Types
  class FavoriteMovieType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :description, String
    field :image_url, String
    field :year, Integer
    field :watched, Boolean
    field :user_id, ID, null: false
  end
end
