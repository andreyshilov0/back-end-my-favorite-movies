module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :login, String
    field :email, String
    field :favorite_genres, [Types::GenreType]
    field :favorite_movies, [Types::FavoriteMovieType]
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
