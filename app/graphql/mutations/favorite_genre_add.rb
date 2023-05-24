module Mutations
  class FavoriteGenreAdd < BaseMutation
    argument :id, ID, required: true

    field :favorite_genres, Types::GenreType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(id:)
      index_genres = id.to_i
      current_user = context[:current_user]
      all_received_genres = tmdb_api.genres_movie['genres']
      genre_parameters = all_received_genres.fetch(index_genres)
      favorite_genre = current_user.genres.build(id: genre_parameters['id'], title: genre_parameters['name'])

      return if favorite_genre.save

      {
        favorite_genre:,
        errors: []
      }
    end
  end
end
