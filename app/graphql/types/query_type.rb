module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :genres, resolver: Queries::Genres
    field :favorite_movie, resolver: Queries::FavoriteMovie
  end
end
