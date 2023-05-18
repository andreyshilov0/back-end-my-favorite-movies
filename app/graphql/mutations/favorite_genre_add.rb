module Mutations
  class FavoriteGenreAdd < BaseMutation
    argument :id, ID, required: true

    field :favorite_genres, Types::GenreType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(id:)
      genres_id = id.to_i
      favorite_genres = TmdbApi.genres_movie['genres']
      genre_parameters = favorite_genres.fetch(genres_id)
      favorite_genre = Genre.new(id: genre_parameters['id'], title: genre_parameters['name'],
                                  user_id: ApplicationController.current_user)
      return if favorite_genre.save

      {
        errors: []
      }
    end
  end
end
