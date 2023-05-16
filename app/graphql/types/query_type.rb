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

    field :favorite_movie, [Types::FavoriteMovieType], null: false do
      argument :id, ID, required: true
    end

    def favorite_movie(id:)
      FavoriteMovie.find(id)
    end

    field :favorite_movie_discover, [Types::MovieParametersType], null: false do
      argument :sort_by, String, required: true
      argument :page, Integer, required: true
      argument :with_genres, String, required: true
      argument :year, Integer, required: true
      argument :vote_average, Integer, required: true
      argument :popularity, Integer, required: true
    end

    def favorite_movie_discover(sort_by:, page:, with_genres:, year:, vote_average:, popularity:)
      FavoriteMovie.find(sort_by, page, with_genres, year, vote_average, popularity)
    end
  end
end
