module Mutations
  class FavoriteMovieDelete < BaseMutation
    field :favorite_movie, Types::FavoriteMovieType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      favorite_movie = FavoriteMovie.find(id)
      unless favorite_movie.destroy
        raise GraphQL::ExecutionError.new I18n.t('favorite_movie_delete'),
                                          extensions: favorite_movie.errors.to_hash
      end

      { favorite_movie: }
    end
  end
end
