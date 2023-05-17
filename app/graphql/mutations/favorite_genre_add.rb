module Mutations
  class FavoriteGenreAdd < BaseMutation
    argument :id, ID, required: true

    field :favorite_genres, Types::GenreType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(id:)
      genres_id = id.to_i
      favorite_genres = TmdbApi.genres_movie['genres']
      genre_id = favorite_genres.fetch(genres_id)['id']
      genres_name = favorite_genres.fetch(genres_id)['name']

      favorite_genre = Genre.new("id": genre_id, "title": genres_name, "user_id": 1)

      if favorite_genre.save
        {
          favorite_genres:,
          errors: []
        }
      else
        {
          errors: favorite_genres.errors
        }
      end
    end
  end
end
