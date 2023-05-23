module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :favorite_genres, resolver: Queries::FavoriteGenres
    field :favorite_movies, resolver: Queries::FavoriteMovies
    field :list_genres, resolver: Queries::ListGenres
    field :list_movie_by_discover, resolver: Queries::ListMovieByDiscover
    field :total_pages, resolver: Queries::TotalPages
  end
end
