# frozen_string_literal: true

module Mutations
  class FavoriteMovieDelete < BaseMutation
    description "Deletes a favorite_movie by ID"

    field :favorite_movie, Types::FavoriteMovieType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      favorite_movie = ::FavoriteMovie.find(id)
      raise GraphQL::ExecutionError.new "Error deleting favorite_movie", extensions: favorite_movie.errors.to_hash unless favorite_movie.destroy

      { favorite_movie: favorite_movie }
    end
  end
end
