module Mutations
  class FavoriteMovieAdd < BaseMutation
    argument :id, ID, required: true

    field :favorite_movie_id, Types::FavoriteMovieType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(id:)
      response_movie_by_id = TmdbApi.new
      current_user = ApplicationController.current_user
      current_user_id = current_user.id
      favorite_movie_by_id = response_movie_by_id.movie_by_id(id)
      favorite_movie = current_user.favorite_movies.build(id: favorite_movie_by_id['id'], title: favorite_movie_by_id['title'],
                                                          description: favorite_movie_by_id['overview'], image_url: favorite_movie_by_id['poster_path'],
                                                          year: favorite_movie_by_id['release_date'], user_id: current_user_id, watched: false)
      return if favorite_movie.save

      {
        favorite_movie:,
        errors: []
      }
    end
  end
end
