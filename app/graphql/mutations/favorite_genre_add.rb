module Mutations
  class FavoriteGenreAdd < BaseMutation
    argument :id, ID, required: true

    field :favorite_genres, Types::GenreType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(id:)
      genres_id = id.to_i
      new_favorite_genres = TmdbApi.new
      current_user = ApplicationController.current_user

      # Он без создания экземпляра не может найти метод current_user,
      # user = self.current_user
      # ссылкой на текущий объект и его метод current_user он найти не может

      current_user_id = current_user.id
      favorite_genres = new_favorite_genres.genres_movie['genres']
      genre_parameters = favorite_genres.fetch(genres_id)
      favorite_genre = current_user.genres.build(id: genre_parameters['id'], title: genre_parameters['name'],
                                 user_id: current_user_id)

      return if favorite_genre.save

      {
        favorite_genre:,
        errors: []
      }
    end
  end
end
