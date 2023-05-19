# frozen_string_literal: true

module Mutations
  class FavoriteMovieDelete < BaseMutation
    field :favorite_movie, Types::FavoriteMovieType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      favorite_movie = FavoriteMovie.find(id)
      unless favorite_movie.destroy
        raise GraphQL::ExecutionError.new 'Error deleting favorite_movie',
                                          extensions: favorite_movie.errors.to_hash
      end
    end
  end
end
