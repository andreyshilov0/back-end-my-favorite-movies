module Mutations
  class FavoriteMovieUpdateWatched < BaseMutation
    field :favorite_movie, Types::FavoriteMovieType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      favorite_movie = FavoriteMovie.find(id)
      new_watched_value = !favorite_movie.watched
      unless favorite_movie.update(watched: new_watched_value)
        raise GraphQL::ExecutionError.new I18n.t('favorite_movie_update'),
                                          extensions: favorite_movie.errors.to_hash
      end

      { favorite_movie: }
    end
  end
end
