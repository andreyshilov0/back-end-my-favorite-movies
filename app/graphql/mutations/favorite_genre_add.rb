module Mutations
  class FavoriteGenreAdd < BaseMutation
    argument :id, ID, required: true

    field :favorite_genres, Types::GenreType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(id:)
      index_genres_id = id.to_i
      current_user = context[:current_user]
      favorite_genres = tmdb_api.genres_movie['genres']
      genre_parameters = favorite_genres.fetch(index_genres_id)
      favorite_genre = current_user.genres.build(id: genre_parameters['id'], title: genre_parameters['name'])

      return if favorite_genre.save

      {
        favorite_genre:,
        errors: []
      }
    end
  end
end
