module Mutations
  class FavoriteMovieAdd < BaseMutation
    argument :id, ID, required: true

    field :favorite_movie_id, Types::FavoriteMovieType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(id:)
      favorite_movie_by_id = TmdbApi.movie_by_id(id)
      id = favorite_movie_by_id['id']
      title = favorite_movie_by_id['title']
      description = favorite_movie_by_id['overview']
      image_url = favorite_movie_by_id['poster_path']
      year = favorite_movie_by_id['release_date']

      favorite_movie = FavoriteMovie.new("id": id, "title": title, "description": description, "image_url": image_url, "year": year,
                                         "user_id": 1)

      if favorite_movie.save
        {
          favorite_movie:,
          errors: []
        }
      else
        {
          errors: favorite_movie.errors
        }
      end
    end
  end
end
