module Mutations
  class FavoriteMovieAdd < BaseMutation
    argument :id, ID, required: true

    field :favorite_movie, Types::FavoriteMovieType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(id:)
      current_user = context[:current_user]
      favorite_movie_by_id = tmdb_api.movie_by_id(id)
      favorite_movie = current_user.favorite_movies.build(id: favorite_movie_by_id['id'], title: favorite_movie_by_id['title'],
                                                          description: favorite_movie_by_id['overview'], image_url: favorite_movie_by_id['poster_path'],
                                                          year: favorite_movie_by_id['release_date'], watched: false)
      return if favorite_movie.save

      {
        favorite_movie:,
        errors: []
      }
    end
  end
end
