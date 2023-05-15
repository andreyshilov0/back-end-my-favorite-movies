module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [Types::UserType], null: false,
                                     description: 'List users'
    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :genres, [Types::GenreType], null: false,
                                       description: 'List genres'

    def genres
      Genre.all
    end

    field :favorite_movies, [Types::FavoriteMovieType], null: false,
                                                        description: 'List movies'

    def favorite_movies
      FavoriteMovie.all
    end

    field :favorite_movie, [Types::UserType], null: false do
      argument :id, ID, required: true
    end

    def favorite_movie(id:)
      FavoriteMovie.find(id)
    end
  end
end
