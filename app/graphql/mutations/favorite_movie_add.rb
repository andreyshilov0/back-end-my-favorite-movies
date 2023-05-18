module Mutations
  class FavoriteMovieAdd < BaseMutation
    argument :id, ID, required: true

    field :favorite_movie_id, Types::FavoriteMovieType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(id:)
      favorite_movie_by_id = TmdbApi.movie_by_id(id)
      favorite_movie = FavoriteMovie.new(id: favorite_movie_by_id['id'], title: favorite_movie_by_id['title'],
                          description: favorite_movie_by_id['overview'], image_url: favorite_movie_by_id['poster_path'],
        year: favorite_movie_by_id['release_date'], user_id: ApplicationController.current_user)
      return if favorite_movie.save

      {
        errors: []
      }
    end
  end
end
