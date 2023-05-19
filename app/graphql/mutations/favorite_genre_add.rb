module Mutations
  class FavoriteGenreAdd < BaseMutation
    argument :id, ID, required: true

    field :favorite_genres, Types::GenreType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(id:)
      genres_id = id.to_i
      response_app_controller = ApplicationController.new
      new_favorite_genres = TmdbApi.new
      current_user = response_app_controller.current_user
      current_user_id = current_user.id
      favorite_genres = new_favorite_genres.genres_movie['genres']
      genre_parameters = favorite_genres.fetch(genres_id)
      favorite_genre = Genre.new(id: genre_parameters['id'], title: genre_parameters['name'],
                                 user_id: current_user_id)
      return if favorite_genre.save

      {
        favorite_genre:,
        errors: []
      }
    end
  end
end
